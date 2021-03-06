DROP TRIGGER IF EXISTS `expensesInsertTrigger`;
DELIMITER //
CREATE TRIGGER `expensesInsertTrigger` AFTER INSERT ON `expenses`
 FOR EACH ROW BEGIN
INSERT INTO `voucher_headers` (`dated`, `voucherType`, `referenceNum`, `description`, `createdOn`, `createdBy`)
 VALUES (NEW.dated, 'EXP', NEW.id, NEW.description, NEW.createdOn, NEW.createdBy);
INSERT INTO `voucher_details` (`voucher_header_id`, `account_id`, `drCr`, `amount`, `description`)
  (
	SELECT `voucher_headers`.`id`, NEW.paid_through, 'C', NEW.amount, NEW.description
	FROM `voucher_headers`
	WHERE `voucher_headers`.`referenceNum` = NEW.id AND `voucher_headers`.`voucherType` = 'EXP' 
);
INSERT INTO `voucher_details` (`voucher_header_id`, `account_id`, `drCr`, `amount`, `description`)
  (
	SELECT `voucher_headers`.`id`, (SELECT `expense_categories`.`account_id` FROM `expense_categories` WHERE `expense_categories`.`id` = NEW.expense_category_id), 'D', NEW.amount, NEW.description
	FROM `voucher_headers`
	WHERE `voucher_headers`.`referenceNum` = NEW.id AND `voucher_headers`.`voucherType` = 'EXP'
);
END
//
DELIMITER ;
