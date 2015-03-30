DROP TRIGGER IF EXISTS `expensesDeleteTrigger`;
DELIMITER //
CREATE TRIGGER `expensesDeleteTrigger` AFTER Delete ON `expenses`
 FOR EACH ROW BEGIN
DECLARE voucherHeaderId INT;
set voucherHeaderId = (SELECT `voucher_headers`.`id` FROM `voucher_headers` WHERE `voucher_headers`.`referenceNum` = OLD.id AND `voucher_headers`.`voucherType` = 'EXP');   
DELETE FROM `voucher_details` WHERE `voucher_details`.`voucher_header_id` = voucherHeaderId;
DELETE FROM `voucher_headers` WHERE `voucher_headers`.`id` = voucherHeaderId;
END
//
DELIMITER ;;
