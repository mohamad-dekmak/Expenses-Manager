-- chart_of_accounts

CREATE OR REPLACE ALGORITHM=TEMPTABLE SQL SECURITY DEFINER VIEW `chart_of_accounts` AS
SELECT `accounts`.`id` AS `id`, `accounts`.`name` AS `accountName`, `countries`.`currencyCode` AS `currency`,
`account_types`.`name` AS `accountType`, `accounts`.`description` AS `description`,
SUM( CASE WHEN `voucher_details`.`drCr` = 'D' THEN `voucher_details`.`amount` ELSE 0 END ) as totalDebit,
SUM( CASE WHEN `voucher_details`.`drCr` = 'C' THEN `voucher_details`.`amount` ELSE 0 END ) as totalCredit,
SUM( CASE WHEN `voucher_details`.`drCr` = 'D' THEN `voucher_details`.`amount` ELSE `voucher_details`.`amount` * -1 END ) as balance
FROM `accounts`
LEFT JOIN `account_types` ON `account_types`.`id` = `accounts`.`account_type_id` 
LEFT JOIN `countries` ON `countries`.`id` = `accounts`.`currency_id`
LEFT JOIN `voucher_details` ON `voucher_details`.`account_id` = `accounts`.`id`
GROUP By `accounts`.`id`
ORDER BY `accounts`.`id` ASC;

-- account_statement

CREATE OR REPLACE ALGORITHM=TEMPTABLE SQL SECURITY DEFINER VIEW `account_statement` AS
SELECT `voucher_details`.`id` AS `id`, `accounts`.`name` AS `accountName`, `countries`.`currencyCode` AS `currency`,
`account_types`.`name` AS `accountType`,
(CASE WHEN `voucher_details`.`drCr` = 'D' THEN `voucher_details`.`amount` ELSE 0 END) AS `debit`,
(CASE WHEN `voucher_details`.`drCr` = 'C' THEN `voucher_details`.`amount` ELSE 0 END) AS `credit`,
`voucher_headers`.`voucherType` AS `voucherType`,
CONCAT( `voucher_headers`.`voucherType`, '-', `voucher_headers`.`referenceNum` ) AS `refNum`,
`voucher_headers`.`dated` AS `dated`,
`accounts`.`description` AS `accountDescription`,
`voucher_details`.`description` AS `voucherDescription`
FROM `voucher_details`
LEFT JOIN `accounts` ON `accounts`.`id` = `voucher_details`.`account_id` 
LEFT JOIN `account_types` ON `account_types`.`id` = `accounts`.`account_type_id` 
LEFT JOIN `countries` ON `countries`.`id` = `accounts`.`currency_id`
LEFT JOIN `voucher_headers` ON `voucher_headers`.`id` = `voucher_details`.`voucher_header_id`
GROUP By `voucher_details`.`id`
ORDER BY `voucher_details`.`id` DESC;

-- statement_of_expenses

CREATE OR REPLACE ALGORITHM=TEMPTABLE SQL SECURITY DEFINER VIEW `statement_of_expenses` AS
SELECT CONCAT( `voucher_headers`.`voucherType`, '-', `voucher_headers`.`referenceNum` ) AS `id`,
`expense_categories`.`name` AS `expenseCategory`, `parentCategory`.`name` AS `expenseCategoryParent`,
`voucher_headers`.`dated` AS `dated`, `expenseAccount`.`name` AS `expenseAccountName`, `countries`.`currencyCode` AS `currency`,
`expenseAccountType`.`name` AS `expenseAccountTypeName`, `paidThroughAccount`.`name` AS `paidThroughAccountName`,
`paidThroughAccountType`.`name` AS `paidThroughAccountTypeName`, `voucher_details`.`amount` AS `amount`, `expenses`.`createdBy` AS `createdBy`
FROM `expenses`
LEFT JOIN `voucher_headers` ON `voucher_headers`.`referenceNum` = `expenses`.`id`
LEFT JOIN `voucher_details` ON `voucher_details`.`voucher_header_id` = `voucher_headers`.`id` AND `voucher_details`.`drCr` = 'D'
LEFT JOIN `expense_categories` ON `expense_categories`.`id` = `expenses`.`expense_category_id`
LEFT JOIN `expense_categories` `parentCategory` ON `parentCategory`.`id` = `expense_categories`.`expense_category_id`
LEFT JOIN `accounts` `expenseAccount` ON `expenseAccount`.`id` = `expense_categories`.`account_id`
LEFT JOIN `account_types` `expenseAccountType` ON `expenseAccountType`.`id` = `expenseAccount`.`account_type_id`
LEFT JOIN `countries` ON `countries`.`id` = `expenseAccount`.`currency_id`
LEFT JOIN `accounts` `paidThroughAccount` ON `paidThroughAccount`.`id` = `expenses`.`paid_through`
LEFT JOIN `account_types` `paidThroughAccountType` ON `paidThroughAccountType`.`id` = `paidThroughAccount`.`account_type_id`
GROUP By `expenses`.`id`
ORDER BY `id` DESC;

-- statement_of_expenses_per_user

CREATE OR REPLACE ALGORITHM=TEMPTABLE SQL SECURITY DEFINER VIEW `statement_of_expenses_per_user` AS
SELECT `statement_of_expenses`.`id`, `users`.`name` AS `user`, `statement_of_expenses`.`amount`,
`statement_of_expenses`.`dated`, `statement_of_expenses`.`expenseCategory`, `statement_of_expenses`.`expenseAccountName`, `statement_of_expenses`.`currency`, `statement_of_expenses`.`paidThroughAccountName`
FROM `statement_of_expenses`
LEFT JOIN `users` ON `users`.`id` = `statement_of_expenses`.`createdBy`
ORDER BY `statement_of_expenses`.`id` DESC;
