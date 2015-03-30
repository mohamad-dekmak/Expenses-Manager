-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 03, 2015 at 06:32 AM
-- Server version: 5.5.41-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `expenses_manager`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE IF NOT EXISTS `accounts` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `currency_id` int(5) NOT NULL,
  `name` varchar(255) NOT NULL,
  `account_type_id` int(10) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`),
  KEY `currency_id` (`currency_id`),
  KEY `account_type_id` (`account_type_id`),
  KEY `account_type_id_2` (`account_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `currency_id`, `name`, `account_type_id`, `description`) VALUES
(1, 234, 'Travel Expenses', 2, NULL),
(2, 234, 'Home - Office', 2, NULL),
(3, 234, 'Car & Taxi', 2, NULL),
(4, 234, 'Other Expenses', 2, NULL),
(6, 234, 'Petty Cash', 1, NULL),
(7, 234, 'Petty Cash User 1', 1, NULL),
(8, 234, 'Petty Cash User 2', 1, NULL),
(9, 1, 'Petty Cash User 3', 1, '');

-- --------------------------------------------------------

--
-- Stand-in structure for view `account_statement`
--
CREATE TABLE IF NOT EXISTS `account_statement` (
`id` int(10)
,`accountName` varchar(255)
,`currency` char(3)
,`accountType` varchar(255)
,`debit` decimal(10,2)
,`credit` decimal(10,2)
,`voucherType` enum('JV','EXP')
,`refNum` varchar(15)
,`dated` date
,`accountDescription` text
,`voucherDescription` text
);
-- --------------------------------------------------------

--
-- Table structure for table `account_types`
--

CREATE TABLE IF NOT EXISTS `account_types` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `account_types`
--

INSERT INTO `account_types` (`id`, `name`) VALUES
(1, 'Asset / Cash'),
(2, 'Expense'),
(3, 'Income');

-- --------------------------------------------------------

--
-- Stand-in structure for view `chart_of_accounts`
--
CREATE TABLE IF NOT EXISTS `chart_of_accounts` (
`id` int(10)
,`accountName` varchar(255)
,`currency` char(3)
,`accountType` varchar(255)
,`description` text
,`totalDebit` decimal(32,2)
,`totalCredit` decimal(32,2)
,`balance` decimal(33,2)
);
-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE IF NOT EXISTS `countries` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `countryCode` char(2) NOT NULL DEFAULT '',
  `countryName` varchar(45) NOT NULL DEFAULT '',
  `currencyCode` char(3) DEFAULT NULL,
  `currencyName` varchar(255) DEFAULT NULL,
  `isoNumeric` char(4) DEFAULT NULL,
  `languages` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=252 ;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `countryCode`, `countryName`, `currencyCode`, `currencyName`, `isoNumeric`, `languages`) VALUES
(1, 'AD', 'Andorra', 'EUR', 'Euro', '020', 'ca'),
(2, 'AE', 'United Arab Emirates', 'AED', 'UAE Dirham', '784', 'ar-AE,fa,en,hi,ur'),
(3, 'AF', 'Afghanistan', 'AFN', 'Afghani', '004', 'fa-AF,ps,uz-AF,tk'),
(4, 'AG', 'Antigua and Barbuda', 'XCD', 'East Caribbean Dollar', '028', 'en-AG'),
(5, 'AI', 'Anguilla', 'XCD', 'East Caribbean Dollar', '660', 'en-AI'),
(6, 'AL', 'Albania', 'ALL', 'Lek', '008', 'sq,el'),
(7, 'AM', 'Armenia', 'AMD', 'Armenian Dram', '051', 'hy'),
(8, 'AO', 'Angola', 'AOA', 'Kwanza', '024', 'pt-AO'),
(9, 'AQ', 'Antarctica', '', 'No universal currency', '010', ''),
(10, 'AR', 'Argentina', 'ARS', 'Argentine Peso', '032', 'es-AR,en,it,de,fr,gn'),
(11, 'AS', 'American Samoa', 'USD', 'US Dollar', '016', 'en-AS,sm,to'),
(12, 'AT', 'Austria', 'EUR', 'Euro', '040', 'de-AT,hr,hu,sl'),
(13, 'AU', 'Australia', 'AUD', 'Australian Dollar', '036', 'en-AU'),
(14, 'AW', 'Aruba', 'AWG', 'Aruban Florin', '533', 'nl-AW,es,en'),
(15, 'AX', 'Aland Islands', 'EUR', 'Euro', '248', 'sv-AX'),
(16, 'AZ', 'Azerbaijan', 'AZN', 'Azerbaijanian Manat', '031', 'az,ru,hy'),
(17, 'BA', 'Bosnia and Herzegovina', 'BAM', 'Convertible Mark', '070', 'bs,hr-BA,sr-BA'),
(18, 'BB', 'Barbados', 'BBD', 'Barbados Dollar', '052', 'en-BB'),
(19, 'BD', 'Bangladesh', 'BDT', 'Taka', '050', 'bn-BD,en'),
(20, 'BE', 'Belgium', 'EUR', 'Euro', '056', 'nl-BE,fr-BE,de-BE'),
(21, 'BF', 'Burkina Faso', 'XOF', 'CFA Franc BCEAO', '854', 'fr-BF'),
(22, 'BG', 'Bulgaria', 'BGN', 'Bulgarian Lev', '100', 'bg,tr-BG'),
(23, 'BH', 'Bahrain', 'BHD', 'Bahraini Dinar', '048', 'ar-BH,en,fa,ur'),
(24, 'BI', 'Burundi', 'BIF', 'Burundi Franc', '108', 'fr-BI,rn'),
(25, 'BJ', 'Benin', 'XOF', 'CFA Franc BCEAO', '204', 'fr-BJ'),
(26, 'BL', 'Saint Barth', 'EUR', 'Euro', '652', 'fr'),
(27, 'BM', 'Bermuda', 'BMD', 'Bermudian Dollar', '060', 'en-BM,pt'),
(28, 'BN', 'Brunei', 'BND', 'Brunei Dollar', '096', 'ms-BN,en-BN'),
(29, 'BO', 'Bolivia', 'BOB', 'Boliviano', '068', 'es-BO,qu,ay'),
(30, 'BQ', 'Bonaire', 'USD', 'US Dollar', '535', 'nl,pap,en'),
(31, 'BR', 'Brazil', 'BRL', 'Brazilian Real', '076', 'pt-BR,es,en,fr'),
(32, 'BS', 'Bahamas', 'BSD', 'Bahamian Dollar', '044', 'en-BS'),
(33, 'BT', 'Bhutan', 'BTN', 'Ngultrum', '064', 'dz'),
(34, 'BV', 'Bouvet Island', 'NOK', 'Norwegian Krone', '074', ''),
(35, 'BW', 'Botswana', 'BWP', 'Pula', '072', 'en-BW,tn-BW'),
(36, 'BY', 'Belarus', 'BYR', 'Belarussian Ruble', '112', 'be,ru'),
(37, 'BZ', 'Belize', 'BZD', 'Belize Dollar', '084', 'en-BZ,es'),
(38, 'CA', 'Canada', 'CAD', 'Canadian Dollar', '124', 'en-CA,fr-CA,iu'),
(39, 'CC', 'Cocos [Keeling] Islands', 'AUD', 'Australian Dollar', '166', 'ms-CC,en'),
(40, 'CD', 'Congo', 'CDF', 'Congolese Franc', '180', 'fr-CD,ln,kg'),
(41, 'CF', 'Central African Republic', 'XAF', 'CFA Franc BEAC', '140', 'fr-CF,sg,ln,kg'),
(42, 'CG', 'Republic of the Congo', 'XAF', 'CFA Franc BEAC', '178', 'fr-CG,kg,ln-CG'),
(43, 'CH', 'Switzerland', 'CHF', 'Swiss Franc', '756', 'de-CH,fr-CH,it-CH,rm'),
(44, 'CI', 'Ivory Coast', 'XOF', 'CFA Franc BCEAO', '384', 'fr-CI'),
(45, 'CK', 'Cook Islands', 'NZD', 'New Zealand Dollar', '184', 'en-CK,mi'),
(46, 'CL', 'Chile', 'CLP', 'Chilean Peso', '152', 'es-CL'),
(47, 'CM', 'Cameroon', 'XAF', 'CFA Franc BEAC', '120', 'en-CM,fr-CM'),
(48, 'CN', 'China', 'CNY', 'Yuan Renminbi', '156', 'zh-CN,yue,wuu,dta,ug,za'),
(49, 'CO', 'Colombia', 'COP', 'Colombian Peso', '170', 'es-CO'),
(50, 'CR', 'Costa Rica', 'CRC', 'Costa Rican Colon', '188', 'es-CR,en'),
(51, 'CU', 'Cuba', 'CUP', 'Cuban Peso', '192', 'es-CU'),
(52, 'CV', 'Cape Verde', 'CVE', 'Cape Verde Escudo', '132', 'pt-CV'),
(53, 'CW', 'Curacao', 'ANG', 'Netherlands Antillean Guilder', '531', 'nl,pap'),
(54, 'CX', 'Christmas Island', 'AUD', 'Australian Dollar', '162', 'en,zh,ms-CC'),
(55, 'CY', 'Cyprus', 'EUR', 'Euro', '196', 'el-CY,tr-CY,en'),
(56, 'CZ', 'Czechia', 'CZK', 'Czech Koruna', '203', 'cs,sk'),
(57, 'DE', 'Germany', 'EUR', 'Euro', '276', 'de'),
(58, 'DJ', 'Djibouti', 'DJF', 'Djibouti Franc', '262', 'fr-DJ,ar,so-DJ,aa'),
(59, 'DK', 'Denmark', 'DKK', 'Danish Krone', '208', 'da-DK,en,fo,de-DK'),
(60, 'DM', 'Dominica', 'XCD', 'East Caribbean Dollar', '212', 'en-DM'),
(61, 'DO', 'Dominican Republic', 'DOP', 'Dominican Peso', '214', 'es-DO'),
(62, 'DZ', 'Algeria', 'DZD', 'Algerian Dinar', '012', 'ar-DZ'),
(63, 'EC', 'Ecuador', 'USD', 'US Dollar', '218', 'es-EC'),
(64, 'EE', 'Estonia', 'EUR', 'Euro', '233', 'et,ru'),
(65, 'EG', 'Egypt', 'EGP', 'Egyptian Pound', '818', 'ar-EG,en,fr'),
(66, 'EH', 'Western Sahara', 'MAD', 'Moroccan Dirham', '732', 'ar,mey'),
(67, 'ER', 'Eritrea', 'ERN', 'Nakfa', '232', 'aa-ER,ar,tig,kun,ti-ER'),
(68, 'ES', 'Spain', 'EUR', 'Euro', '724', 'es-ES,ca,gl,eu,oc'),
(69, 'ET', 'Ethiopia', 'ETB', 'Ethiopian Birr', '231', 'am,en-ET,om-ET,ti-ET,so-ET,sid'),
(70, 'FI', 'Finland', 'EUR', 'Euro', '246', 'fi-FI,sv-FI,smn'),
(71, 'FJ', 'Fiji', 'FJD', 'Fiji Dollar', '242', 'en-FJ,fj'),
(72, 'FK', 'Falkland Islands', 'FKP', 'Falkland Islands Pound', '238', 'en-FK'),
(73, 'FM', 'Micronesia', 'USD', 'US Dollar', '583', 'en-FM,chk,pon,yap,kos,uli,woe,'),
(74, 'FO', 'Faroe Islands', 'DKK', 'Danish Krone', '234', 'fo,da-FO'),
(75, 'FR', 'France', 'EUR', 'Euro', '250', 'fr-FR,frp,br,co,ca,eu,oc'),
(76, 'GA', 'Gabon', 'XAF', 'CFA Franc BEAC', '266', 'fr-GA'),
(77, 'GB', 'United Kingdom', 'GBP', 'Pound Sterling', '826', 'en-GB,cy-GB,gd'),
(78, 'GD', 'Grenada', 'XCD', 'East Caribbean Dollar', '308', 'en-GD'),
(79, 'GE', 'Georgia', 'GEL', 'Lari', '268', 'ka,ru,hy,az'),
(80, 'GF', 'French Guiana', 'EUR', 'Euro', '254', 'fr-GF'),
(81, 'GG', 'Guernsey', 'GBP', 'Pound Sterling', '831', 'en,fr'),
(82, 'GH', 'Ghana', 'GHS', 'Ghana Cedi', '288', 'en-GH,ak,ee,tw'),
(83, 'GI', 'Gibraltar', 'GIP', 'Gibraltar Pound', '292', 'en-GI,es,it,pt'),
(84, 'GL', 'Greenland', 'DKK', 'Danish Krone', '304', 'kl,da-GL,en'),
(85, 'GM', 'Gambia', 'GMD', 'Dalasi', '270', 'en-GM,mnk,wof,wo,ff'),
(86, 'GN', 'Guinea', 'GNF', 'Guinea Franc', '324', 'fr-GN'),
(87, 'GP', 'Guadeloupe', 'EUR', 'Euro', '312', 'fr-GP'),
(88, 'GQ', 'Equatorial Guinea', 'XAF', 'CFA Franc BEAC', '226', 'es-GQ,fr'),
(89, 'GR', 'Greece', 'EUR', 'Euro', '300', 'el-GR,en,fr'),
(90, 'GS', 'South Georgia and the South Sandwich Islands', 'GBP', 'Pound Sterling', '239', 'en'),
(91, 'GT', 'Guatemala', 'GTQ', 'Quetzal', '320', 'es-GT'),
(92, 'GU', 'Guam', 'USD', 'US Dollar', '316', 'en-GU,ch-GU'),
(93, 'GW', 'Guinea-Bissau', 'XOF', 'CFA Franc BCEAO', '624', 'pt-GW,pov'),
(94, 'GY', 'Guyana', 'GYD', 'Guyana Dollar', '328', 'en-GY'),
(95, 'HK', 'Hong Kong', 'HKD', 'Hong Kong Dollar', '344', 'zh-HK,yue,zh,en'),
(96, 'HM', 'Heard Island and McDonald Islands', 'AUD', 'Australian Dollar', '334', ''),
(97, 'HN', 'Honduras', 'HNL', 'Lempira', '340', 'es-HN'),
(98, 'HR', 'Croatia', 'HRK', 'Croatian Kuna', '191', 'hr-HR,sr'),
(99, 'HT', 'Haiti', 'HTG', 'Gourde', '332', 'ht,fr-HT'),
(100, 'HU', 'Hungary', 'HUF', 'Forint', '348', 'hu-HU'),
(101, 'ID', 'Indonesia', 'IDR', 'Rupiah', '360', 'id,en,nl,jv'),
(102, 'IE', 'Ireland', 'EUR', 'Euro', '372', 'en-IE,ga-IE'),
(103, 'IL', 'Israel', 'ILS', 'New Israeli Sheqel', '376', 'he,ar-IL,en-IL,'),
(104, 'IM', 'Isle of Man', 'GBP', 'Pound Sterling', '833', 'en,gv'),
(105, 'IN', 'India', 'INR', 'Indian Rupee', '356', 'en-IN,hi,bn,te,mr,ta,ur,gu,kn,'),
(106, 'IO', 'British Indian Ocean Territory', 'USD', 'US Dollar', '086', 'en-IO'),
(107, 'IQ', 'Iraq', 'IQD', 'Iraqi Dinar', '368', 'ar-IQ,ku,hy'),
(108, 'IR', 'Iran', 'IRR', 'Iranian Rial', '364', 'fa-IR,ku'),
(109, 'IS', 'Iceland', 'ISK', 'Iceland Krona', '352', 'is,en,de,da,sv,no'),
(110, 'IT', 'Italy', 'EUR', 'Euro', '380', 'it-IT,de-IT,fr-IT,sc,ca,co,sl'),
(111, 'JE', 'Jersey', 'GBP', 'Pound Sterling', '832', 'en,pt'),
(112, 'JM', 'Jamaica', 'JMD', 'Jamaican Dollar', '388', 'en-JM'),
(113, 'JO', 'Jordan', 'JOD', 'Jordanian Dinar', '400', 'ar-JO,en'),
(114, 'JP', 'Japan', 'JPY', 'Yen', '392', 'ja'),
(115, 'KE', 'Kenya', 'KES', 'Kenyan Shilling', '404', 'en-KE,sw-KE'),
(116, 'KG', 'Kyrgyzstan', 'KGS', 'Som', '417', 'ky,uz,ru'),
(117, 'KH', 'Cambodia', 'KHR', 'Riel', '116', 'km,fr,en'),
(118, 'KI', 'Kiribati', 'AUD', 'Australian Dollar', '296', 'en-KI,gil'),
(119, 'KM', 'Comoros', 'KMF', 'Comoro Franc', '174', 'ar,fr-KM'),
(120, 'KN', 'Saint Kitts and Nevis', 'XCD', 'East Caribbean Dollar', '659', 'en-KN'),
(121, 'KP', 'North Korea', 'KPW', 'North Korean Won', '408', 'ko-KP'),
(122, 'KR', 'South Korea', 'KRW', 'Won', '410', 'ko-KR,en'),
(123, 'KW', 'Kuwait', 'KWD', 'Kuwaiti Dinar', '414', 'ar-KW,en'),
(124, 'KY', 'Cayman Islands', 'KYD', 'Cayman Islands Dollar', '136', 'en-KY'),
(125, 'KZ', 'Kazakhstan', 'KZT', 'Tenge', '398', 'kk,ru'),
(126, 'LA', 'Laos', 'LAK', 'Kip', '418', 'lo,fr,en'),
(127, 'LB', 'Lebanon', 'LBP', 'Lebanese Pound', '422', 'ar-LB,fr-LB,en,hy'),
(128, 'LC', 'Saint Lucia', 'XCD', 'East Caribbean Dollar', '662', 'en-LC'),
(129, 'LI', 'Liechtenstein', 'CHF', 'Swiss Franc', '438', 'de-LI'),
(130, 'LK', 'Sri Lanka', 'LKR', 'Sri Lanka Rupee', '144', 'si,ta,en'),
(131, 'LR', 'Liberia', 'LRD', 'Liberian Dollar', '430', 'en-LR'),
(132, 'LS', 'Lesotho', 'LSL', 'Loti', '426', 'en-LS,st,zu,xh'),
(133, 'LT', 'Lithuania', 'LTL', 'Lithuanian Litas', '440', 'lt,ru,pl'),
(134, 'LU', 'Luxembourg', 'EUR', 'Euro', '442', 'lb,de-LU,fr-LU'),
(135, 'LV', 'Latvia', 'LVL', 'Latvian Lats', '428', 'lv,ru,lt'),
(136, 'LY', 'Libya', 'LYD', 'Libyan Dinar', '434', 'ar-LY,it,en'),
(137, 'MA', 'Morocco', 'MAD', 'Moroccan Dirham', '504', 'ar-MA,fr'),
(138, 'MC', 'Monaco', 'EUR', 'Euro', '492', 'fr-MC,en,it'),
(139, 'MD', 'Moldova', 'MDL', 'Moldovan Leu', '498', 'ro,ru,gag,tr'),
(140, 'ME', 'Montenegro', 'EUR', 'Euro', '499', 'sr,hu,bs,sq,hr,rom'),
(141, 'MF', 'Saint Martin', 'EUR', 'Euro', '663', 'fr'),
(142, 'MG', 'Madagascar', 'MGA', 'Malagasy Ariary', '450', 'fr-MG,mg'),
(143, 'MH', 'Marshall Islands', 'USD', 'US Dollar', '584', 'mh,en-MH'),
(144, 'MK', 'Macedonia', 'MKD', 'Denar', '807', 'mk,sq,tr,rmm,sr'),
(145, 'ML', 'Mali', 'XOF', 'CFA Franc BCEAO', '466', 'fr-ML,bm'),
(146, 'MM', 'Myanmar [Burma]', 'MMK', 'Kyat', '104', 'my'),
(147, 'MN', 'Mongolia', 'MNT', 'Tugrik', '496', 'mn,ru'),
(148, 'MO', 'Macao', 'MOP', 'Pataca', '446', 'zh,zh-MO,pt'),
(149, 'MP', 'Northern Mariana Islands', 'USD', 'US Dollar', '580', 'fil,tl,zh,ch-MP,en-MP'),
(150, 'MQ', 'Martinique', 'EUR', 'Euro', '474', 'fr-MQ'),
(151, 'MR', 'Mauritania', 'MRO', 'Ouguiya', '478', 'ar-MR,fuc,snk,fr,mey,wo'),
(152, 'MS', 'Montserrat', 'XCD', 'East Caribbean Dollar', '500', 'en-MS'),
(153, 'MT', 'Malta', 'EUR', 'Euro', '470', 'mt,en-MT'),
(154, 'MU', 'Mauritius', 'MUR', 'Mauritius Rupee', '480', 'en-MU,bho,fr'),
(155, 'MV', 'Maldives', 'MVR', 'Rufiyaa', '462', 'dv,en'),
(156, 'MW', 'Malawi', 'MWK', 'Kwacha', '454', 'ny,yao,tum,swk'),
(157, 'MX', 'Mexico', 'MXN', 'Mexican Peso', '484', 'es-MX'),
(158, 'MY', 'Malaysia', 'MYR', 'Malaysian Ringgit', '458', 'ms-MY,en,zh,ta,te,ml,pa,th'),
(159, 'MZ', 'Mozambique', 'MZN', 'Mozambique Metical', '508', 'pt-MZ,vmw'),
(160, 'NA', 'Namibia', 'NAD', 'Namibia Dollar', '516', 'en-NA,af,de,hz,naq'),
(161, 'NC', 'New Caledonia', 'XPF', 'CFP Franc', '540', 'fr-NC'),
(162, 'NE', 'Niger', 'XOF', 'CFA Franc BCEAO', '562', 'fr-NE,ha,kr,dje'),
(163, 'NF', 'Norfolk Island', 'AUD', 'Australian Dollar', '574', 'en-NF'),
(164, 'NG', 'Nigeria', 'NGN', 'Naira', '566', 'en-NG,ha,yo,ig,ff'),
(165, 'NI', 'Nicaragua', 'NIO', 'Cordoba Oro', '558', 'es-NI,en'),
(166, 'NL', 'Netherlands', 'EUR', 'Euro', '528', 'nl-NL,fy-NL'),
(167, 'NO', 'Norway', 'NOK', 'Norwegian Krone', '578', 'no,nb,nn,se,fi'),
(168, 'NP', 'Nepal', 'NPR', 'Nepalese Rupee', '524', 'ne,en'),
(169, 'NR', 'Nauru', 'AUD', 'Australian Dollar', '520', 'na,en-NR'),
(170, 'NU', 'Niue', 'NZD', 'New Zealand Dollar', '570', 'niu,en-NU'),
(171, 'NZ', 'New Zealand', 'NZD', 'New Zealand Dollar', '554', 'en-NZ,mi'),
(172, 'OM', 'Oman', 'OMR', 'Rial Omani', '512', 'ar-OM,en,bal,ur'),
(173, 'PA', 'Panama', 'PAB', 'Balboa', '591', 'es-PA,en'),
(174, 'PE', 'Peru', 'PEN', 'Nuevo Sol', '604', 'es-PE,qu,ay'),
(175, 'PF', 'French Polynesia', 'XPF', 'CFP Franc', '258', 'fr-PF,ty'),
(176, 'PG', 'Papua New Guinea', 'PGK', 'Kina', '598', 'en-PG,ho,meu,tpi'),
(177, 'PH', 'Philippines', 'PHP', 'Philippine Peso', '608', 'tl,en-PH,fil'),
(178, 'PK', 'Pakistan', 'PKR', 'Pakistan Rupee', '586', 'ur-PK,en-PK,pa,sd,ps,brh'),
(179, 'PL', 'Poland', 'PLN', 'Zloty', '616', 'pl'),
(180, 'PM', 'Saint Pierre and Miquelon', 'EUR', 'Euro', '666', 'fr-PM'),
(181, 'PN', 'Pitcairn Islands', 'NZD', 'New Zealand Dollar', '612', 'en-PN'),
(182, 'PR', 'Puerto Rico', 'USD', 'US Dollar', '630', 'en-PR,es-PR'),
(183, 'PS', 'Palestine', 'ILS', 'New Israeli Sheqel', '275', 'ar-PS'),
(184, 'PT', 'Portugal', 'EUR', 'Euro', '620', 'pt-PT,mwl'),
(185, 'PW', 'Palau', 'USD', 'US Dollar', '585', 'pau,sov,en-PW,tox,ja,fil,zh'),
(186, 'PY', 'Paraguay', 'PYG', 'Guarani', '600', 'es-PY,gn'),
(187, 'PY', 'Paraguay', 'PYG', 'Guarani', '600', 'es-PY,gn'),
(188, 'QA', 'Qatar', 'QAR', 'Qatari Rial', '634', 'ar-QA,es'),
(189, 'RE', 'Réunion', 'EUR', 'Euro', '638', 'fr-RE'),
(190, 'RO', 'Romania', 'RON', 'New Romanian Leu', '642', 'ro,hu,rom'),
(191, 'RS', 'Serbia', 'RSD', 'Serbian Dinar', '688', 'sr,hu,bs,rom'),
(192, 'RU', 'Russia', 'RUB', 'Russian Ruble', '643', 'ru,tt,xal,cau,ady,kv,ce,tyv,cv'),
(193, 'RW', 'Rwanda', 'RWF', 'Rwanda Franc', '646', 'rw,en-RW,fr-RW,sw'),
(194, 'SA', 'Saudi Arabia', 'SAR', 'Saudi Riyal', '682', 'ar-SA'),
(195, 'SB', 'Solomon Islands', 'SBD', 'Solomon Islands Dollar', '090', 'en-SB,tpi'),
(196, 'SC', 'Seychelles', 'SCR', 'Seychelles Rupee', '690', 'en-SC,fr-SC'),
(197, 'SD', 'Sudan', 'SDG', 'Sudanese Pound', '729', 'ar-SD,en,fia'),
(198, 'SE', 'Sweden', 'SEK', 'Swedish Krona', '752', 'sv-SE,se,sma,fi-SE'),
(199, 'SG', 'Singapore', 'SGD', 'Singapore Dollar', '702', 'cmn,en-SG,ms-SG,ta-SG,zh-SG'),
(200, 'SH', 'Saint Helena', 'SHP', 'Saint Helena Pound', '654', 'en-SH'),
(201, 'SI', 'Slovenia', 'EUR', 'Euro', '705', 'sl,sh'),
(202, 'SJ', 'Svalbard and Jan Mayen', 'NOK', 'Norwegian Krone', '744', 'no,ru'),
(203, 'SK', 'Slovakia', 'EUR', 'Euro', '703', 'sk,hu'),
(204, 'SL', 'Sierra Leone', 'SLL', 'Leone', '694', 'en-SL,men,tem'),
(205, 'SM', 'San Marino', 'EUR', 'Euro', '674', 'it-SM'),
(206, 'SN', 'Senegal', 'XOF', 'CFA Franc BCEAO', '686', 'fr-SN,wo,fuc,mnk'),
(207, 'SO', 'Somalia', 'SOS', 'Somali Shilling', '706', 'so-SO,ar-SO,it,en-SO'),
(208, 'SR', 'Suriname', 'SRD', 'Surinam Dollar', '740', 'nl-SR,en,srn,hns,jv'),
(209, 'SS', 'South Sudan', 'SSP', 'South Sudanese Pound', '728', 'en'),
(210, 'ST', 'Sao Tome and Principe', 'STD', 'Dobra', '678', 'pt-ST'),
(211, 'SV', 'El Salvador', 'USD', 'US Dollar', '222', 'es-SV'),
(212, 'SX', 'Sint Maarten', 'ANG', 'Netherlands Antillean Guilder', '534', 'nl,en'),
(213, 'SY', 'Syria', 'SYP', 'Syrian Pound', '760', 'ar-SY,ku,hy,arc,fr,en'),
(214, 'SZ', 'Swaziland', 'SZL', 'Lilangeni', '748', 'en-SZ,ss-SZ'),
(215, 'TC', 'Turks and Caicos Islands', 'USD', 'US Dollar', '796', 'en-TC'),
(216, 'TD', 'Chad', 'XAF', 'CFA Franc BEAC', '148', 'fr-TD,ar-TD,sre'),
(217, 'TF', 'French Southern Territories', 'EUR', 'Euro', '260', 'fr'),
(218, 'TG', 'Togo', 'XOF', 'CFA Franc BCEAO', '768', 'fr-TG,ee,hna,kbp,dag,ha'),
(219, 'TH', 'Thailand', 'THB', 'Baht', '764', 'th,en'),
(220, 'TJ', 'Tajikistan', 'TJS', 'Somoni', '762', 'tg,ru'),
(221, 'TK', 'Tokelau', 'NZD', 'New Zealand Dollar', '772', 'tkl,en-TK'),
(222, 'TL', 'East Timor', 'USD', 'US Dollar', '626', 'tet,pt-TL,id,en'),
(223, 'TM', 'Turkmenistan', 'TMT', 'Turkmenistan New Manat', '795', 'tk,ru,uz'),
(224, 'TN', 'Tunisia', 'TND', 'Tunisian Dinar', '788', 'ar-TN,fr'),
(225, 'TO', 'Tonga', 'TOP', 'Paanga', '776', 'to,en-TO'),
(226, 'TR', 'Turkey', 'TRY', 'Turkish Lira', '792', 'tr-TR,ku,diq,az,av'),
(227, 'TT', 'Trinidad and Tobago', 'TTD', 'Trinidad and Tobago Dollar', '780', 'en-TT,hns,fr,es,zh'),
(228, 'TV', 'Tuvalu', 'AUD', 'Australian Dollar', '798', 'tvl,en,sm,gil'),
(229, 'TW', 'Taiwan', 'TWD', 'New Taiwan Dollar', '158', 'zh-TW,zh,nan,hak'),
(230, 'TZ', 'Tanzania', 'TZS', 'Tanzanian Shilling', '834', 'sw-TZ,en,ar'),
(231, 'UA', 'Ukraine', 'UAH', 'Hryvnia', '804', 'uk,ru-UA,rom,pl,hu'),
(232, 'UG', 'Uganda', 'UGX', 'Uganda Shilling', '800', 'en-UG,lg,sw,ar'),
(233, 'UM', 'U.S. Minor Outlying Islands', 'USD', 'US Dollar', '581', 'en-UM'),
(234, 'US', 'United States', 'USD', 'US Dollar', '840', 'en-US,es-US,haw,fr'),
(235, 'UY', 'Uruguay', 'UYU', 'Peso Uruguayo', '858', 'es-UY'),
(236, 'UZ', 'Uzbekistan', 'UZS', 'Uzbekistan Sum', '860', 'uz,ru,tg'),
(237, 'VA', 'Vatican City', 'EUR', 'Euro', '336', 'la,it,fr'),
(238, 'VC', 'Saint Vincent and the Grenadines', 'XCD', 'East Caribbean Dollar', '670', 'en-VC,fr'),
(239, 'VE', 'Venezuela', 'VEF', 'Bolivar', '862', 'es-VE'),
(240, 'VG', 'British Virgin Islands', 'USD', 'US Dollar', '092', 'en-VG'),
(241, 'VI', 'U.S. Virgin Islands', 'USD', 'US Dollar', '850', 'en-VI'),
(242, 'VN', 'Vietnam', 'VND', 'Dong', '704', 'vi,en,fr,zh,km'),
(243, 'VU', 'Vanuatu', 'VUV', 'Vatu', '548', 'bi,en-VU,fr-VU'),
(244, 'WF', 'Wallis and Futuna', 'XPF', 'CFP Franc', '876', 'wls,fud,fr-WF'),
(245, 'WS', 'Samoa', 'WST', 'Tala', '882', 'sm,en-WS'),
(246, 'XK', 'Kosovo', 'EUR', 'Euro', '0', 'sq,sr'),
(247, 'YE', 'Yemen', 'YER', 'Yemeni Rial', '887', 'ar-YE'),
(248, 'YT', 'Mayotte', 'EUR', 'Euro', '175', 'fr-YT'),
(249, 'ZA', 'South Africa', 'ZAR', 'Rand', '710', 'zu,xh,af,nso,en-ZA,tn,st,ts,ss'),
(250, 'ZM', 'Zambia', 'ZMK', NULL, '894', 'en-ZM,bem,loz,lun,lue,ny,toi'),
(251, 'ZW', 'Zimbabwe', 'ZWL', 'Zimbabwe Dollar', '716', 'en-ZW,sn,nr,nd');

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE IF NOT EXISTS `expenses` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `expense_category_id` int(10) NOT NULL,
  `paid_through` int(10) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `dated` date NOT NULL,
  `description` text,
  `createdOn` datetime DEFAULT NULL,
  `createdBy` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `expense_category_id` (`expense_category_id`),
  KEY `paid_through` (`paid_through`),
  KEY `createdBy` (`createdBy`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `expenses`
--

INSERT INTO `expenses` (`id`, `expense_category_id`, `paid_through`, `amount`, `dated`, `description`, `createdOn`, `createdBy`) VALUES
(1, 8, 7, 50.00, '2015-03-02', 'Internet Receipt - Feb', '2015-03-02 00:00:00', 2),
(2, 7, 7, 70.00, '2015-03-01', 'Electricity Receipt - Feb', '2015-03-01 00:00:00', 2),
(3, 10, 7, 75.00, '2015-03-02', 'Taxi: daily taxi from Home to University  - Feb', '2015-03-02 00:00:00', 2),
(4, 9, 6, 500.00, '2015-03-03', 'Home Rent - Feb', '2015-03-03 00:00:00', 1),
(5, 2, 8, 450.00, '2015-03-04', 'MEA Ticket to Dubai', '2015-03-04 00:00:00', 3),
(6, 1, 8, 600.00, '2015-03-05', 'Travel: Meal + Taxi ...', '2015-03-05 00:00:00', 3),
(7, 14, 9, 400.00, '2015-03-01', 'Other Exp: School materials, payments, ...', '2015-03-01 00:00:00', 4);

--
-- Triggers `expenses`
--
DROP TRIGGER IF EXISTS `expensesDeleteTrigger`;
DELIMITER //
CREATE TRIGGER `expensesDeleteTrigger` AFTER DELETE ON `expenses`
 FOR EACH ROW BEGIN
DECLARE voucherHeaderId INT;
set voucherHeaderId = (SELECT `voucher_headers`.`id` FROM `voucher_headers` WHERE `voucher_headers`.`referenceNum` = OLD.id AND `voucher_headers`.`voucherType` = 'EXP');   
DELETE FROM `voucher_details` WHERE `voucher_details`.`voucher_header_id` = voucherHeaderId;
DELETE FROM `voucher_headers` WHERE `voucher_headers`.`id` = voucherHeaderId;
END
//
DELIMITER ;
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
DROP TRIGGER IF EXISTS `expensesUpdateTrigger`;
DELIMITER //
CREATE TRIGGER `expensesUpdateTrigger` AFTER UPDATE ON `expenses`
 FOR EACH ROW BEGIN
DECLARE voucherHeaderId INT;
set voucherHeaderId = (SELECT `voucher_headers`.`id` FROM `voucher_headers` WHERE `voucher_headers`.`referenceNum` = NEW.id AND `voucher_headers`.`voucherType` = 'EXP');   
DELETE FROM `voucher_details` WHERE `voucher_details`.`voucher_header_id` = voucherHeaderId;
DELETE FROM `voucher_headers` WHERE `voucher_headers`.`id` = voucherHeaderId;
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

-- --------------------------------------------------------

--
-- Table structure for table `expense_categories`
--

CREATE TABLE IF NOT EXISTS `expense_categories` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `expense_category_id` int(10) DEFAULT NULL,
  `account_id` int(10) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `expense_category_id` (`expense_category_id`),
  KEY `account_id` (`account_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `expense_categories`
--

INSERT INTO `expense_categories` (`id`, `expense_category_id`, `account_id`, `name`) VALUES
(1, NULL, 1, 'Travel'),
(2, 1, 1, 'Flight'),
(3, 1, 1, 'Hotel'),
(4, 1, 1, 'Meal'),
(5, 1, 1, 'Transportation'),
(6, NULL, 2, 'Home - Office'),
(7, 6, 2, 'Electricity'),
(8, 6, 2, 'Internet & Telephone'),
(9, 6, 2, 'Rent'),
(10, NULL, 3, 'Transportation'),
(11, 10, 3, 'Fuel'),
(12, 10, 3, 'Parking'),
(13, 10, 3, 'Taxi'),
(14, NULL, 4, 'Other Expenses');

-- --------------------------------------------------------

--
-- Table structure for table `journals`
--

CREATE TABLE IF NOT EXISTS `journals` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `from_account` int(10) NOT NULL,
  `to_account` int(10) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `dated` date NOT NULL,
  `description` text,
  `createdOn` datetime DEFAULT NULL,
  `createdBy` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `account_id` (`from_account`),
  KEY `paid_through` (`to_account`),
  KEY `createdBy` (`createdBy`),
  KEY `from_account` (`from_account`),
  KEY `to_account` (`to_account`),
  KEY `createdBy_2` (`createdBy`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `journals`
--

INSERT INTO `journals` (`id`, `from_account`, `to_account`, `amount`, `dated`, `description`, `createdOn`, `createdBy`) VALUES
(1, 6, 7, 300.00, '2015-03-02', 'Feed Petty Cash 1', '2015-03-01 00:00:00', 1),
(2, 6, 8, 1500.00, '2015-03-01', 'Feed Petty Cash 2', '2015-03-01 00:00:00', 1),
(3, 6, 9, 700.00, '2015-03-02', 'Feed Petty Cash 3', '2015-03-02 00:00:00', 1);

--
-- Triggers `journals`
--
DROP TRIGGER IF EXISTS `journalsDeleteTrigger`;
DELIMITER //
CREATE TRIGGER `journalsDeleteTrigger` AFTER DELETE ON `journals`
 FOR EACH ROW BEGIN
DECLARE voucherHeaderId INT;
set voucherHeaderId = (SELECT `voucher_headers`.`id` FROM `voucher_headers` WHERE `voucher_headers`.`referenceNum` = OLD.id AND `voucher_headers`.`voucherType` = 'JV');   
DELETE FROM `voucher_details` WHERE `voucher_details`.`voucher_header_id` = voucherHeaderId;
DELETE FROM `voucher_headers` WHERE `voucher_headers`.`id` = voucherHeaderId;
END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `journalsInsertTrigger`;
DELIMITER //
CREATE TRIGGER `journalsInsertTrigger` AFTER INSERT ON `journals`
 FOR EACH ROW BEGIN
INSERT INTO `voucher_headers` (`dated`, `voucherType`, `referenceNum`, `description`, `createdOn`, `createdBy`)
 VALUES (NEW.dated, 'JV', NEW.id, NEW.description, NEW.createdOn, NEW.createdBy);
INSERT INTO `voucher_details` (`voucher_header_id`, `account_id`, `drCr`, `amount`, `description`)
  (
	SELECT `voucher_headers`.`id`, NEW.from_account, 'C', NEW.amount, NEW.description
	FROM `voucher_headers`
	WHERE `voucher_headers`.`referenceNum` = NEW.id AND `voucher_headers`.`voucherType` = 'JV'
);
INSERT INTO `voucher_details` (`voucher_header_id`, `account_id`, `drCr`, `amount`, `description`)
  (
	SELECT `voucher_headers`.`id`, NEW.to_account, 'D', NEW.amount, NEW.description
	FROM `voucher_headers`
	WHERE `voucher_headers`.`referenceNum` = NEW.id AND `voucher_headers`.`voucherType` = 'JV'
);
END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `journalsUpdateTrigger`;
DELIMITER //
CREATE TRIGGER `journalsUpdateTrigger` AFTER UPDATE ON `journals`
 FOR EACH ROW BEGIN
DECLARE voucherHeaderId INT;
set voucherHeaderId = (SELECT `voucher_headers`.`id` FROM `voucher_headers` WHERE `voucher_headers`.`referenceNum` = NEW.id AND `voucher_headers`.`voucherType` = 'JV');   
DELETE FROM `voucher_details` WHERE `voucher_details`.`voucher_header_id` = voucherHeaderId;
DELETE FROM `voucher_headers` WHERE `voucher_headers`.`id` = voucherHeaderId;
INSERT INTO `voucher_headers` (`dated`, `voucherType`, `referenceNum`, `description`, `createdOn`, `createdBy`)
 VALUES (NEW.dated, 'JV', NEW.id, NEW.description, NEW.createdOn, NEW.createdBy);
INSERT INTO `voucher_details` (`voucher_header_id`, `account_id`, `drCr`, `amount`, `description`)
  (
	SELECT `voucher_headers`.`id`, NEW.from_account, 'C', NEW.amount, NEW.description
	FROM `voucher_headers`
	WHERE `voucher_headers`.`referenceNum` = NEW.id AND `voucher_headers`.`voucherType` = 'JV'
);
INSERT INTO `voucher_details` (`voucher_header_id`, `account_id`, `drCr`, `amount`, `description`)
  (
	SELECT `voucher_headers`.`id`, NEW.to_account, 'D', NEW.amount, NEW.description
	FROM `voucher_headers`
	WHERE `voucher_headers`.`referenceNum` = NEW.id AND `voucher_headers`.`voucherType` = 'JV'
);
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `statement_of_expenses`
--
CREATE TABLE IF NOT EXISTS `statement_of_expenses` (
`id` varchar(15)
,`expenseCategory` varchar(255)
,`expenseCategoryParent` varchar(255)
,`dated` date
,`expenseAccountName` varchar(255)
,`currency` char(3)
,`expenseAccountTypeName` varchar(255)
,`paidThroughAccountName` varchar(255)
,`paidThroughAccountTypeName` varchar(255)
,`amount` decimal(10,2)
,`createdBy` int(10)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `statement_of_expenses_per_user`
--
CREATE TABLE IF NOT EXISTS `statement_of_expenses_per_user` (
`id` varchar(15)
,`user` varchar(255)
,`amount` decimal(10,2)
,`dated` date
,`expenseCategory` varchar(255)
,`expenseAccountName` varchar(255)
,`currency` char(3)
,`paidThroughAccountName` varchar(255)
);
-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `groupName` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `password`, `groupName`) VALUES
(1, 'Administrator', 'admin', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'admin'),
(2, 'User 1', 'user_1', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 'user'),
(3, 'User 2', 'user_2', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 'user'),
(4, 'User 3', 'user_3', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 'user');

-- --------------------------------------------------------

--
-- Table structure for table `voucher_details`
--

CREATE TABLE IF NOT EXISTS `voucher_details` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `voucher_header_id` int(10) NOT NULL,
  `account_id` int(10) NOT NULL,
  `drCr` char(1) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`),
  KEY `voucher_header_id` (`voucher_header_id`),
  KEY `account_id` (`account_id`),
  KEY `voucher_header_id_2` (`voucher_header_id`),
  KEY `account_id_2` (`account_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=33 ;

--
-- Dumping data for table `voucher_details`
--

INSERT INTO `voucher_details` (`id`, `voucher_header_id`, `account_id`, `drCr`, `amount`, `description`) VALUES
(1, 1, 7, 'C', 50.00, 'Internet Receipt - Feb'),
(2, 1, 2, 'D', 50.00, 'Internet Receipt - Feb'),
(3, 2, 7, 'C', 70.00, 'Electricity Receipt - Feb'),
(4, 2, 2, 'D', 70.00, 'Electricity Receipt - Feb'),
(15, 8, 6, 'C', 300.00, 'Feed Petty Cash 1'),
(16, 8, 7, 'D', 300.00, 'Feed Petty Cash 1'),
(17, 9, 6, 'C', 1500.00, 'Feed Petty Cash 2'),
(18, 9, 8, 'D', 1500.00, 'Feed Petty Cash 2'),
(19, 10, 7, 'C', 75.00, 'Taxi: daily taxi from Home to University  - Feb'),
(20, 10, 3, 'D', 75.00, 'Taxi: daily taxi from Home to University  - Feb'),
(21, 11, 8, 'C', 450.00, 'MEA Ticket to Dubai'),
(22, 11, 1, 'D', 450.00, 'MEA Ticket to Dubai'),
(23, 12, 8, 'C', 600.00, 'Travel: Meal + Taxi ...'),
(24, 12, 1, 'D', 600.00, 'Travel: Meal + Taxi ...'),
(25, 13, 9, 'C', 400.00, 'Other Exp: School materials, payments, ...'),
(26, 13, 4, 'D', 400.00, 'Other Exp: School materials, payments, ...'),
(27, 14, 6, 'C', 500.00, 'Home Rent - Feb'),
(28, 14, 2, 'D', 500.00, 'Home Rent - Feb'),
(31, 16, 6, 'C', 700.00, 'Feed Petty Cash 3'),
(32, 16, 9, 'D', 700.00, 'Feed Petty Cash 3');

-- --------------------------------------------------------

--
-- Table structure for table `voucher_headers`
--

CREATE TABLE IF NOT EXISTS `voucher_headers` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `dated` date NOT NULL,
  `voucherType` enum('JV','EXP') NOT NULL,
  `referenceNum` int(10) DEFAULT NULL,
  `description` text,
  `createdOn` datetime NOT NULL,
  `createdBy` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `createdBy` (`createdBy`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `voucher_headers`
--

INSERT INTO `voucher_headers` (`id`, `dated`, `voucherType`, `referenceNum`, `description`, `createdOn`, `createdBy`) VALUES
(1, '2015-03-02', 'EXP', 1, 'Internet Receipt - Feb', '2015-03-02 00:00:00', 2),
(2, '2015-03-01', 'EXP', 2, 'Electricity Receipt - Feb', '2015-03-01 00:00:00', 2),
(8, '2015-03-02', 'JV', 1, 'Feed Petty Cash 1', '2015-03-01 00:00:00', 1),
(9, '2015-03-01', 'JV', 2, 'Feed Petty Cash 2', '2015-03-01 00:00:00', 1),
(10, '2015-03-02', 'EXP', 3, 'Taxi: daily taxi from Home to University  - Feb', '2015-03-02 00:00:00', 2),
(11, '2015-03-04', 'EXP', 5, 'MEA Ticket to Dubai', '2015-03-04 00:00:00', 3),
(12, '2015-03-05', 'EXP', 6, 'Travel: Meal + Taxi ...', '2015-03-05 00:00:00', 3),
(13, '2015-03-01', 'EXP', 7, 'Other Exp: School materials, payments, ...', '2015-03-01 00:00:00', 4),
(14, '2015-03-03', 'EXP', 4, 'Home Rent - Feb', '2015-03-03 00:00:00', 1),
(16, '2015-03-02', 'JV', 3, 'Feed Petty Cash 3', '2015-03-02 00:00:00', 1);

-- --------------------------------------------------------

--
-- Structure for view `account_statement`
--
DROP TABLE IF EXISTS `account_statement`;

CREATE ALGORITHM=TEMPTABLE DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `account_statement` AS select `voucher_details`.`id` AS `id`,`accounts`.`name` AS `accountName`,`countries`.`currencyCode` AS `currency`,`account_types`.`name` AS `accountType`,(case when (`voucher_details`.`drCr` = 'D') then `voucher_details`.`amount` else 0 end) AS `debit`,(case when (`voucher_details`.`drCr` = 'C') then `voucher_details`.`amount` else 0 end) AS `credit`,`voucher_headers`.`voucherType` AS `voucherType`,concat(`voucher_headers`.`voucherType`,'-',`voucher_headers`.`referenceNum`) AS `refNum`,`voucher_headers`.`dated` AS `dated`,`accounts`.`description` AS `accountDescription`,`voucher_details`.`description` AS `voucherDescription` from ((((`voucher_details` left join `accounts` on((`accounts`.`id` = `voucher_details`.`account_id`))) left join `account_types` on((`account_types`.`id` = `accounts`.`account_type_id`))) left join `countries` on((`countries`.`id` = `accounts`.`currency_id`))) left join `voucher_headers` on((`voucher_headers`.`id` = `voucher_details`.`voucher_header_id`))) group by `voucher_details`.`id` order by `voucher_details`.`id` desc;

-- --------------------------------------------------------

--
-- Structure for view `chart_of_accounts`
--
DROP TABLE IF EXISTS `chart_of_accounts`;

CREATE ALGORITHM=TEMPTABLE DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `chart_of_accounts` AS select `accounts`.`id` AS `id`,`accounts`.`name` AS `accountName`,`countries`.`currencyCode` AS `currency`,`account_types`.`name` AS `accountType`,`accounts`.`description` AS `description`,sum((case when (`voucher_details`.`drCr` = 'D') then `voucher_details`.`amount` else 0 end)) AS `totalDebit`,sum((case when (`voucher_details`.`drCr` = 'C') then `voucher_details`.`amount` else 0 end)) AS `totalCredit`,sum((case when (`voucher_details`.`drCr` = 'D') then `voucher_details`.`amount` else (`voucher_details`.`amount` * -(1)) end)) AS `balance` from (((`accounts` left join `account_types` on((`account_types`.`id` = `accounts`.`account_type_id`))) left join `countries` on((`countries`.`id` = `accounts`.`currency_id`))) left join `voucher_details` on((`voucher_details`.`account_id` = `accounts`.`id`))) group by `accounts`.`id` order by `accounts`.`id`;

-- --------------------------------------------------------

--
-- Structure for view `statement_of_expenses`
--
DROP TABLE IF EXISTS `statement_of_expenses`;

CREATE ALGORITHM=TEMPTABLE DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `statement_of_expenses` AS select concat(`voucher_headers`.`voucherType`,'-',`voucher_headers`.`referenceNum`) AS `id`,`expense_categories`.`name` AS `expenseCategory`,`parentCategory`.`name` AS `expenseCategoryParent`,`voucher_headers`.`dated` AS `dated`,`expenseAccount`.`name` AS `expenseAccountName`,`countries`.`currencyCode` AS `currency`,`expenseAccountType`.`name` AS `expenseAccountTypeName`,`paidThroughAccount`.`name` AS `paidThroughAccountName`,`paidThroughAccountType`.`name` AS `paidThroughAccountTypeName`,`voucher_details`.`amount` AS `amount`,`expenses`.`createdBy` AS `createdBy` from (((((((((`expenses` left join `voucher_headers` on((`voucher_headers`.`referenceNum` = `expenses`.`id`))) left join `voucher_details` on(((`voucher_details`.`voucher_header_id` = `voucher_headers`.`id`) and (`voucher_details`.`drCr` = 'D')))) left join `expense_categories` on((`expense_categories`.`id` = `expenses`.`expense_category_id`))) left join `expense_categories` `parentCategory` on((`parentCategory`.`id` = `expense_categories`.`expense_category_id`))) left join `accounts` `expenseAccount` on((`expenseAccount`.`id` = `expense_categories`.`account_id`))) left join `account_types` `expenseAccountType` on((`expenseAccountType`.`id` = `expenseAccount`.`account_type_id`))) left join `countries` on((`countries`.`id` = `expenseAccount`.`currency_id`))) left join `accounts` `paidThroughAccount` on((`paidThroughAccount`.`id` = `expenses`.`paid_through`))) left join `account_types` `paidThroughAccountType` on((`paidThroughAccountType`.`id` = `paidThroughAccount`.`account_type_id`))) group by `expenses`.`id` order by concat(`voucher_headers`.`voucherType`,'-',`voucher_headers`.`referenceNum`) desc;

-- --------------------------------------------------------

--
-- Structure for view `statement_of_expenses_per_user`
--
DROP TABLE IF EXISTS `statement_of_expenses_per_user`;

CREATE ALGORITHM=TEMPTABLE DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `statement_of_expenses_per_user` AS select `statement_of_expenses`.`id` AS `id`,`users`.`name` AS `user`,`statement_of_expenses`.`amount` AS `amount`,`statement_of_expenses`.`dated` AS `dated`,`statement_of_expenses`.`expenseCategory` AS `expenseCategory`,`statement_of_expenses`.`expenseAccountName` AS `expenseAccountName`,`statement_of_expenses`.`currency` AS `currency`,`statement_of_expenses`.`paidThroughAccountName` AS `paidThroughAccountName` from (`statement_of_expenses` left join `users` on((`users`.`id` = `statement_of_expenses`.`createdBy`))) order by `statement_of_expenses`.`id` desc;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `accounts`
--
ALTER TABLE `accounts`
  ADD CONSTRAINT `accounts_ibfk_1` FOREIGN KEY (`currency_id`) REFERENCES `countries` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `accounts_ibfk_2` FOREIGN KEY (`account_type_id`) REFERENCES `account_types` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `expenses`
--
ALTER TABLE `expenses`
  ADD CONSTRAINT `expenses_ibfk_1` FOREIGN KEY (`expense_category_id`) REFERENCES `expense_categories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `expenses_ibfk_3` FOREIGN KEY (`paid_through`) REFERENCES `accounts` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `expenses_ibfk_5` FOREIGN KEY (`createdBy`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `expense_categories`
--
ALTER TABLE `expense_categories`
  ADD CONSTRAINT `expense_categories_ibfk_1` FOREIGN KEY (`expense_category_id`) REFERENCES `expense_categories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `expense_categories_ibfk_2` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `journals`
--
ALTER TABLE `journals`
  ADD CONSTRAINT `journals_ibfk_1` FOREIGN KEY (`from_account`) REFERENCES `accounts` (`id`) ON UPDATE NO ACTION,
  ADD CONSTRAINT `journals_ibfk_2` FOREIGN KEY (`to_account`) REFERENCES `accounts` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `journals_ibfk_3` FOREIGN KEY (`createdBy`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `voucher_details`
--
ALTER TABLE `voucher_details`
  ADD CONSTRAINT `voucher_details_ibfk_1` FOREIGN KEY (`voucher_header_id`) REFERENCES `voucher_headers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `voucher_details_ibfk_2` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `voucher_headers`
--
ALTER TABLE `voucher_headers`
  ADD CONSTRAINT `voucher_headers_ibfk_1` FOREIGN KEY (`createdBy`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
