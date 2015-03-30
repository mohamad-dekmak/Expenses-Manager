DROP TRIGGER IF EXISTS `journalsDeleteTrigger`;
DELIMITER //
CREATE TRIGGER `journalsDeleteTrigger` AFTER Delete ON `journals`
 FOR EACH ROW BEGIN
DECLARE voucherHeaderId INT;
set voucherHeaderId = (SELECT `voucher_headers`.`id` FROM `voucher_headers` WHERE `voucher_headers`.`referenceNum` = OLD.id AND `voucher_headers`.`voucherType` = 'JV');   
DELETE FROM `voucher_details` WHERE `voucher_details`.`voucher_header_id` = voucherHeaderId;
DELETE FROM `voucher_headers` WHERE `voucher_headers`.`id` = voucherHeaderId;
END
//
DELIMITER ;;
