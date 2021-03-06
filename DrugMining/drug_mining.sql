-- phpMyAdmin SQL Dump
-- version 3.3.9
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 27, 2015 at 05:46 AM
-- Server version: 5.5.8
-- PHP Version: 5.3.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `drug_mining`
--

-- --------------------------------------------------------

--
-- Table structure for table `drugs`
--

CREATE TABLE IF NOT EXISTS `drugs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `drug_name` varchar(50) NOT NULL,
  `drug_desc` varchar(200) NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=28 ;

--
-- Dumping data for table `drugs`
--

INSERT INTO `drugs` (`id`, `drug_name`, `drug_desc`) VALUES
(1, 'antifungals', 'Anti Fungals For Removing Fungus nd all...'),
(2, 'antidotes', 'Antidotes for Immunity'),
(3, 'vitamins', 'Vitamins for Daily Use'),
(4, 'new medic', 'new medic'),
(5, 'antiseptics', 'open wounds , scratches'),
(6, 'antacids', 'nuetralize and counters acidity'),
(7, 'allergenics', 'medical conditions associated with allergy'),
(8, 'amebicides', 'eradicate parasitic species  of amebea in humans'),
(9, 'aminoglycosides', 'bacterial antibiotics'),
(10, 'aminopenicillins', 'bactericidal beta-lactum antibiotics'),
(11, 'aminosalicylates', 'bacteriostatic against mycobacterium tuberculosis'),
(12, 'amylin analogs', '37 amino acids polypeptide hormone'),
(13, 'anorexiants', 'act on brain to suppress appetite'),
(14, 'anthelmintics', 'eradicate intestinals worms'),
(15, 'antiandrogens', 'androgens receptor block'),
(16, 'anticoagulants', 'prevents blood clotting'),
(17, 'antidepressants', 'treats depressions and improve symptoms'),
(18, 'antidiarrheals', 'treat diarrhea with confirmed bacterial cause'),
(19, 'antihistamines', 'inhibits actions of histamines by blocking receptors'),
(20, 'antimetabolites', 'interfere with enzymes with DNA synthesis'),
(21, 'antineoplastics', 'damage DNA and initiates apoptosis'),
(22, 'antipsoriatics', 'applied to the skin or taken orally for treating psoriasis '),
(23, 'antipsychotics', 'blocks dopamine receptors in the brain'),
(24, 'antirheumatis', 'treat the symptoms of rheumatoid arthritis'),
(25, 'antithyroid agents', 'prevents or suppresses the biosynthesis of thyroid hormones'),
(26, 'antitussives', 'suppress coughing  '),
(27, 'antiviral agents', 'viral infections');

-- --------------------------------------------------------

--
-- Table structure for table `medicines`
--

CREATE TABLE IF NOT EXISTS `medicines` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `drug_id` int(6) NOT NULL,
  `med_name` varchar(30) NOT NULL,
  `doc_id` varchar(12) NOT NULL,
  `desc` varchar(30000) NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `medicines`
--

INSERT INTO `medicines` (`id`, `drug_id`, `med_name`, `doc_id`, `desc`) VALUES
(1, 1, 'sdgfg', 'user6', 'fasdbdabn'),
(2, 2, 'sadfdaf', 'user6', 'sfgbsfb'),
(3, 1, 'adfsDGVsv', 'user6', 'sfbvsabWSFB'),
(4, 1, 'sadfsfgfdahnsgnj', 'xyz', 'srmn'),
(5, 3, 'orange Zest', 'abc', 'for vitamin C deficient People'),
(6, 4, 'Nothing', 'DR1', 'Engergygetic'),
(7, 5, 'nuesprene', 'DR1', 'cuts,bruises'),
(8, 6, 'pentec 40', 'DR1', 'acidity'),
(9, 6, 'ENO', 'DR1', 'acidity'),
(10, 7, 'Diphenhydramine', 'DR1', 'A histamine H1 anta'),
(11, 7, 'Cyproheptadine', 'DR1', 'A serotonin antagonist and a histamine H1 blocker used as antipruritic, appetite stimulant, antiallergic, and for the post-gastrectomy dumping syndrome, etc. '),
(12, 7, 'Promethazine', 'DR1', 'A phenothiazine derivative with histamine H1-blocking, antimuscarinic, and sedative properties. It is used as an antiallergic, in pruritus, for motion sickness and sedation, and also in animals.');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE IF NOT EXISTS `reviews` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `drug_id` int(6) NOT NULL,
  `med_id` int(6) NOT NULL,
  `review` varchar(200) NOT NULL,
  `user_type` varchar(15) NOT NULL,
  `user_name` varchar(25) NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=68 ;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `drug_id`, `med_id`, `review`, `user_type`, `user_name`) VALUES
(7, 1, 3, 'ok drug', 'doctor', 'abc'),
(15, 2, 2, 'i''ve loved this drugs a lot', 'user', 'pqr'),
(18, 2, 2, 'vbmnhbj, vgjnc dfhg ', 'doctor', 'DR1'),
(19, 4, 6, 'very effective but due to high power feels heavy', 'user', 'user1'),
(20, 4, 6, 'very powerful drug,being a asthama patient having cramps in legs . asthama patients must not use this. ', 'user', 'user1'),
(21, 4, 6, 'very effefctive drug. got rid of anesthesia. no side efffects . worked for me', 'user', 'user1'),
(22, 5, 7, 'healing fast. excellent', 'user', 'user1'),
(23, 1, 3, 'this drug was not useful, i felt sleepy', 'user', 'user1'),
(25, 1, 1, 'Excellent help to my depression. But gained weight, even on 2 1/2 mg, and worse, I became borderline diabetic.', 'user', 'user1'),
(28, 1, 1, 'very bad pathetic', 'user', 'user1'),
(29, 1, 1, 'Has worked very well in lowering my cholesterol by 30% within 3 months Have no known present side effects', 'user', 'user1'),
(30, 1, 1, 'useful for diabetic patients only', 'doctor', 'DR1'),
(37, 1, 1, 'I simply hate this drug.', 'user', 'user1'),
(39, 1, 1, 'My mom had this when she was suffering from typhoid. she recovered very fast.', 'user', 'user1'),
(42, 1, 1, 'life saving drug!', 'user', 'user1'),
(56, 1, 1, 'slow recovery fed up. trying new one prescribed by doctor.', 'user', 'user1'),
(57, 1, 1, 'excellent recovery is very fast', 'user', 'user1'),
(58, 6, 8, 'no recommended', 'user', 'user1'),
(59, 6, 8, 'slow recovery fed up. trying new one prescribed by doctor.', 'user', 'user1'),
(60, 1, 1, 'nice drug', 'user', 'user1'),
(61, 1, 1, 'slow recovery fed up. trying new one prescribed by doctor.', 'user', 'user1'),
(62, 1, 1, 'nice drug use it', 'user', 'user1'),
(63, 1, 1, 'not recommended', 'user', 'user1'),
(64, 1, 1, 'This is effective drug and must be used.', 'user', 'user1'),
(65, 1, 1, 'It is good to use this drug.', 'user', 'user1'),
(66, 1, 1, 'i think this medicine has made me n=more jittery and nervous than before starting, i m thinking to rip someones head off.', 'user', 'user1'),
(67, 1, 1, ' very bad pathetic', 'user', 'user1');

-- --------------------------------------------------------

--
-- Table structure for table `train_data`
--

CREATE TABLE IF NOT EXISTS `train_data` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `class` varchar(25) NOT NULL,
  `keyword` varchar(50) NOT NULL,
  `freq` int(11) NOT NULL,
  `tot_keys` int(11) NOT NULL,
  `key_weight` decimal(10,4) NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14476 ;

--
-- Dumping data for table `train_data`
--

INSERT INTO `train_data` (`id`, `class`, `keyword`, `freq`, `tot_keys`, `key_weight`) VALUES
(14104, 'positive', 'need', 1, 543, 0.0018),
(14105, 'positive', 'total', 1, 543, 0.0018),
(14106, 'positive', 'understand', 1, 543, 0.0018),
(14107, 'positive', 'bearabl', 1, 543, 0.0018),
(14108, 'positive', 'benefit', 1, 543, 0.0018),
(14109, 'positive', 'treatment', 3, 543, 0.0055),
(14110, 'positive', 'knew', 1, 543, 0.0018),
(14111, 'positive', 'awesom', 1, 543, 0.0018),
(14112, 'positive', 'dot', 1, 543, 0.0018),
(14113, 'positive', 'novemb', 1, 543, 0.0018),
(14114, 'positive', 'recovery,enjoi', 1, 543, 0.0018),
(14115, 'positive', 'hydrocoxi', 1, 543, 0.0018),
(14116, 'positive', 'time', 1, 543, 0.0018),
(14117, 'positive', 'year', 9, 543, 0.0166),
(14118, 'positive', 'place', 1, 543, 0.0018),
(14119, 'positive', 'deep', 1, 543, 0.0018),
(14120, 'positive', 'right', 1, 543, 0.0018),
(14121, 'positive', 'bare', 1, 543, 0.0018),
(14122, 'positive', 'week)', 1, 543, 0.0018),
(14123, 'positive', 'accid', 1, 543, 0.0018),
(14124, 'positive', 'qualiti', 1, 543, 0.0018),
(14125, 'positive', 'zocor', 1, 543, 0.0018),
(14126, 'positive', 'sleep', 2, 543, 0.0037),
(14127, 'positive', 'mom', 2, 543, 0.0037),
(14128, 'positive', 'few', 3, 543, 0.0055),
(14129, 'positive', 'tri', 3, 543, 0.0055),
(14130, 'positive', 'peopl', 1, 543, 0.0018),
(14131, 'positive', 'wont', 1, 543, 0.0018),
(14132, 'positive', 'eas', 1, 543, 0.0018),
(14133, 'positive', 'lot', 1, 543, 0.0018),
(14134, 'positive', 'sick', 1, 543, 0.0018),
(14135, 'positive', 'blotch', 1, 543, 0.0018),
(14136, 'positive', 'review', 1, 543, 0.0018),
(14137, 'positive', 'symptom', 1, 543, 0.0018),
(14138, 'positive', 'tunnel', 1, 543, 0.0018),
(14139, 'positive', 'increas', 1, 543, 0.0018),
(14140, 'positive', '(after', 1, 543, 0.0018),
(14141, 'positive', 'god', 1, 543, 0.0018),
(14142, 'positive', 'common', 1, 543, 0.0018),
(14143, 'positive', 'chronic', 2, 543, 0.0037),
(14144, 'positive', 'use', 2, 543, 0.0037),
(14145, 'positive', 'lipitor', 1, 543, 0.0018),
(14146, 'positive', 'brought', 1, 543, 0.0018),
(14147, 'positive', 'relief', 3, 543, 0.0055),
(14148, 'positive', 'usedveri', 1, 543, 0.0018),
(14149, 'positive', 'life', 9, 543, 0.0166),
(14150, 'positive', 'side', 8, 543, 0.0147),
(14151, 'positive', 'current', 1, 543, 0.0018),
(14152, 'positive', 'best', 1, 543, 0.0018),
(14153, 'positive', 'hard', 2, 543, 0.0037),
(14154, 'positive', 'look', 1, 543, 0.0018),
(14155, 'positive', 'wasnt', 1, 543, 0.0018),
(14156, 'positive', 'happi', 1, 543, 0.0018),
(14157, 'positive', 'later', 1, 543, 0.0018),
(14158, 'positive', 'ey', 1, 543, 0.0018),
(14159, 'positive', 'back', 3, 543, 0.0055),
(14160, 'positive', 'suffer', 3, 543, 0.0055),
(14161, 'positive', 'us', 13, 543, 0.0239),
(14162, 'positive', 'excel', 1, 543, 0.0018),
(14163, 'positive', 'hour', 2, 543, 0.0037),
(14164, 'positive', 'abiliti', 1, 543, 0.0018),
(14165, 'positive', 'up', 2, 543, 0.0037),
(14166, 'positive', 'new', 3, 543, 0.0055),
(14167, 'positive', 'buspiron', 1, 543, 0.0018),
(14168, 'positive', 'abilifi', 3, 543, 0.0055),
(14169, 'positive', 'satisfi', 1, 543, 0.0018),
(14170, 'positive', 'experienc', 2, 543, 0.0037),
(14171, 'positive', '(one', 1, 543, 0.0018),
(14172, 'positive', 'down', 1, 543, 0.0018),
(14173, 'positive', 'reliev', 1, 543, 0.0018),
(14174, 'positive', 'ago', 2, 543, 0.0037),
(14175, 'positive', 'week', 3, 543, 0.0055),
(14176, 'positive', 'keep', 1, 543, 0.0018),
(14177, 'positive', 'nerv', 2, 543, 0.0037),
(14178, 'positive', 'drugit', 1, 543, 0.0018),
(14179, 'positive', 'drop', 1, 543, 0.0018),
(14180, 'positive', 'normal', 1, 543, 0.0018),
(14181, 'positive', 'took', 1, 543, 0.0018),
(14182, 'positive', 'half', 1, 543, 0.0018),
(14183, 'positive', 'good', 8, 543, 0.0147),
(14184, 'positive', 'long', 1, 543, 0.0018),
(14185, 'positive', 'doctor', 2, 543, 0.0037),
(14186, 'positive', 'th', 1, 543, 0.0018),
(14187, 'positive', 'slight', 1, 543, 0.0018),
(14188, 'positive', 'dark', 1, 543, 0.0018),
(14189, 'positive', 'surgeri', 1, 543, 0.0018),
(14190, 'positive', 'control', 2, 543, 0.0037),
(14191, 'positive', 'bactrum', 1, 543, 0.0018),
(14192, 'positive', 'availableit', 1, 543, 0.0018),
(14193, 'positive', 'beginn', 1, 543, 0.0018),
(14194, 'positive', 'far', 2, 543, 0.0037),
(14195, 'positive', 'nonsens', 1, 543, 0.0018),
(14196, 'positive', 'dai', 8, 543, 0.0147),
(14197, 'positive', 'urg', 2, 543, 0.0037),
(14198, 'positive', 'hydrocodoneacetaminophen', 1, 543, 0.0018),
(14199, 'positive', 'cholesterol', 2, 543, 0.0037),
(14200, 'positive', 'continu', 1, 543, 0.0018),
(14201, 'positive', 'bodi', 4, 543, 0.0074),
(14202, 'positive', 'believ', 1, 543, 0.0018),
(14203, 'positive', 'better', 5, 543, 0.0092),
(14204, 'positive', '(effexor', 1, 543, 0.0018),
(14205, 'positive', 'tough', 1, 543, 0.0018),
(14206, 'positive', 'day', 1, 543, 0.0018),
(14207, 'positive', 'saver', 2, 543, 0.0037),
(14208, 'positive', 'fast', 3, 543, 0.0055),
(14209, 'positive', 'walk', 1, 543, 0.0018),
(14210, 'positive', 'make', 1, 543, 0.0018),
(14211, 'positive', 'vicdon', 1, 543, 0.0018),
(14212, 'positive', 'thing', 1, 543, 0.0018),
(14213, 'positive', 'depress', 7, 543, 0.0129),
(14214, 'positive', 'med', 3, 543, 0.0055),
(14215, 'positive', 'cipro', 1, 543, 0.0018),
(14216, 'positive', 'result', 2, 543, 0.0037),
(14217, 'positive', 'thisveri', 1, 543, 0.0018),
(14218, 'positive', 'well', 4, 543, 0.0074),
(14219, 'positive', 'didnt', 2, 543, 0.0037),
(14220, 'positive', 'hang', 1, 543, 0.0018),
(14221, 'positive', 'recommend', 3, 543, 0.0055),
(14222, 'positive', 'dose', 3, 543, 0.0055),
(14223, 'positive', 'reach', 1, 543, 0.0018),
(14224, 'positive', 'reclus', 1, 543, 0.0018),
(14225, 'positive', 'xr)', 1, 543, 0.0018),
(14226, 'positive', 'react', 1, 543, 0.0018),
(14227, 'positive', 'all', 4, 543, 0.0074),
(14228, 'positive', 'talk', 1, 543, 0.0018),
(14229, 'positive', 'feel', 7, 543, 0.0129),
(14230, 'positive', 'five', 2, 543, 0.0037),
(14231, 'positive', 'fibromyalgia', 1, 543, 0.0018),
(14232, 'positive', 'handi', 1, 543, 0.0018),
(14233, 'positive', 'aw', 1, 543, 0.0018),
(14234, 'positive', 'costli', 1, 543, 0.0018),
(14235, 'positive', 'sever', 1, 543, 0.0018),
(14236, 'positive', 'great', 4, 543, 0.0074),
(14237, 'positive', 'caus', 1, 543, 0.0018),
(14238, 'positive', 'effect', 12, 543, 0.0221),
(14239, 'positive', 'ad', 1, 543, 0.0018),
(14240, 'positive', 'improv', 1, 543, 0.0018),
(14241, 'positive', 'chang', 1, 543, 0.0018),
(14242, 'positive', 'stomach', 1, 543, 0.0018),
(14243, 'positive', 'recoveri', 2, 543, 0.0037),
(14244, 'positive', 'energi', 2, 543, 0.0037),
(14245, 'positive', 'tak', 7, 543, 0.0129),
(14246, 'positive', 'person', 1, 543, 0.0018),
(14247, 'positive', 'fell', 1, 543, 0.0018),
(14248, 'positive', 'lower', 1, 543, 0.0018),
(14249, 'positive', 'reason', 1, 543, 0.0018),
(14250, 'positive', 'sai', 1, 543, 0.0018),
(14251, 'positive', 'cowork', 1, 543, 0.0018),
(14252, 'positive', 'went', 2, 543, 0.0037),
(14253, 'positive', 'help', 12, 543, 0.0221),
(14254, 'positive', 'given', 3, 543, 0.0055),
(14255, 'positive', 'initial', 1, 543, 0.0018),
(14256, 'positive', 'on', 6, 543, 0.0110),
(14257, 'positive', 'morphin', 2, 543, 0.0037),
(14258, 'positive', '(?)', 1, 543, 0.0018),
(14259, 'positive', 'glad', 1, 543, 0.0018),
(14260, 'positive', 'final', 1, 543, 0.0018),
(14261, 'positive', 'acclim', 1, 543, 0.0018),
(14262, 'positive', 'again', 4, 543, 0.0074),
(14263, 'positive', 'lexapro', 1, 543, 0.0018),
(14264, 'positive', 'bad', 1, 543, 0.0018),
(14265, 'positive', 'absolut', 1, 543, 0.0018),
(14266, 'positive', 'prescript', 1, 543, 0.0018),
(14267, 'positive', 'board', 1, 543, 0.0018),
(14268, 'positive', 'antidepress', 1, 543, 0.0018),
(14269, 'positive', 'provid', 1, 543, 0.0018),
(14270, 'positive', 'not', 4, 543, 0.0074),
(14271, 'positive', 'attitud', 1, 543, 0.0018),
(14272, 'positive', 'now', 1, 543, 0.0018),
(14273, 'positive', 'start', 7, 543, 0.0129),
(14274, 'positive', 'regain', 1, 543, 0.0018),
(14275, 'positive', 'month', 4, 543, 0.0074),
(14276, 'positive', 'myself', 2, 543, 0.0037),
(14277, 'positive', 'littl', 1, 543, 0.0018),
(14278, 'positive', 'pain', 21, 543, 0.0387),
(14279, 'positive', 'hospit', 2, 543, 0.0037),
(14280, 'positive', 'resum', 1, 543, 0.0018),
(14281, 'positive', 'quit', 1, 543, 0.0018),
(14282, 'positive', 'greatli', 1, 543, 0.0018),
(14283, 'positive', 'clear', 1, 543, 0.0018),
(14284, 'positive', 'thank', 1, 543, 0.0018),
(14285, 'positive', 'pill', 1, 543, 0.0018),
(14286, 'positive', 'apparent', 1, 543, 0.0018),
(14287, 'positive', 'grate', 1, 543, 0.0018),
(14288, 'positive', 'seizur', 1, 543, 0.0018),
(14289, 'positive', 'pleas', 1, 543, 0.0018),
(14290, 'positive', 'easili', 1, 543, 0.0018),
(14291, 'positive', 'everyon', 1, 543, 0.0018),
(14292, 'positive', 'mg', 3, 543, 0.0055),
(14293, 'positive', 'me', 3, 543, 0.0055),
(14294, 'positive', 'end', 1, 543, 0.0018),
(14295, 'positive', 'want', 2, 543, 0.0037),
(14296, 'positive', 'balanc', 1, 543, 0.0018),
(14297, 'positive', 'alot', 1, 543, 0.0018),
(14298, 'positive', 'miracle', 1, 543, 0.0018),
(14299, 'positive', 'let', 1, 543, 0.0018),
(14300, 'positive', 'smallest', 1, 543, 0.0018),
(14301, 'positive', 'injuri', 1, 543, 0.0018),
(14302, 'positive', 'fulli', 1, 543, 0.0018),
(14303, 'positive', 'highli', 1, 543, 0.0018),
(14304, 'positive', 'despit', 1, 543, 0.0018),
(14305, 'positive', 'damag', 1, 543, 0.0018),
(14306, 'positive', 'product', 1, 543, 0.0018),
(14307, 'positive', 'differ', 2, 543, 0.0037),
(14308, 'positive', 'brand', 1, 543, 0.0018),
(14309, 'positive', 'cut', 1, 543, 0.0018),
(14310, 'positive', 'whatsoev', 1, 543, 0.0018),
(14311, 'positive', 'old', 1, 543, 0.0018),
(14312, 'positive', 'save', 3, 543, 0.0055),
(14313, 'positive', 'marriag', 1, 543, 0.0018),
(14314, 'positive', 'kill', 1, 543, 0.0018),
(14315, 'positive', 'anxieti', 5, 543, 0.0092),
(14316, 'positive', 'notic', 1, 543, 0.0018),
(14317, 'positive', 'skin', 1, 543, 0.0018),
(14318, 'positive', 'love', 4, 543, 0.0074),
(14319, 'positive', 'ultram', 1, 543, 0.0018),
(14320, 'positive', 'level', 2, 543, 0.0037),
(14321, 'positive', 'swell', 1, 543, 0.0018),
(14322, 'positive', 'woman', 1, 543, 0.0018),
(14323, 'positive', 'tear', 1, 543, 0.0018),
(14324, 'positive', 'morn', 1, 543, 0.0018),
(14325, 'positive', 'wonder', 2, 543, 0.0037),
(14326, 'positive', 'longer', 1, 543, 0.0018),
(14327, 'positive', 'realiz', 1, 543, 0.0018),
(14328, 'positive', 'medicin', 8, 543, 0.0147),
(14329, 'positive', 'head', 1, 543, 0.0018),
(14330, 'positive', 'bladder', 1, 543, 0.0018),
(14331, 'positive', 'live', 3, 543, 0.0055),
(14332, 'positive', 'work', 8, 543, 0.0147),
(14333, 'positive', 'joint', 1, 543, 0.0018),
(14334, 'positive', 'liter', 1, 543, 0.0018),
(14335, 'positive', 'bed', 1, 543, 0.0018),
(14336, 'positive', 'use)', 1, 543, 0.0018),
(14337, 'positive', 'strong', 1, 543, 0.0018),
(14338, 'positive', 'bless', 1, 543, 0.0018),
(14339, 'positive', 'even', 1, 543, 0.0018),
(14340, 'positive', 'word', 1, 543, 0.0018),
(14341, 'positive', 'medic', 10, 543, 0.0184),
(14342, 'positive', 'treat', 1, 543, 0.0018),
(14343, 'positive', 'calm', 1, 543, 0.0018),
(14344, 'positive', 'stop', 1, 543, 0.0018),
(14345, 'positive', 'effectiveit', 1, 543, 0.0018),
(14346, 'positive', 'awai', 1, 543, 0.0018),
(14347, 'positive', 'allow', 1, 543, 0.0018),
(14348, 'positive', 'incid', 1, 543, 0.0018),
(14349, 'positive', 'push', 1, 543, 0.0018),
(14350, 'positive', 'remiss', 1, 543, 0.0018),
(14351, 'positive', 'headach', 1, 543, 0.0018),
(14352, 'positive', 'full', 1, 543, 0.0018),
(14353, 'positive', 'die', 1, 543, 0.0018),
(14354, 'positive', 'fine', 1, 543, 0.0018),
(14355, 'positive', 'less', 1, 543, 0.0018),
(14356, 'positive', 'drug', 21, 543, 0.0387),
(14357, 'positive', 'it', 3, 543, 0.0055),
(14358, 'positive', 'septemb', 1, 543, 0.0018),
(14359, 'positive', 'origin', 1, 543, 0.0018),
(14360, 'positive', 'inject', 1, 543, 0.0018),
(14361, 'positive', 'intens', 1, 543, 0.0018),
(14362, 'positive', 'problem', 2, 543, 0.0037),
(14363, 'positive', 'im', 3, 543, 0.0055),
(14364, 'positive', 'prozac', 2, 543, 0.0037),
(14365, 'positive', 'pass', 1, 543, 0.0018),
(14366, 'positive', 'thi', 1, 543, 0.0018),
(14367, 'positive', 'two', 1, 543, 0.0018),
(14368, 'positive', 'felt', 2, 543, 0.0037),
(14369, 'positive', 'rash', 1, 543, 0.0018),
(14370, 'positive', 'term', 1, 543, 0.0018),
(14371, 'positive', 'infect', 1, 543, 0.0018),
(14372, 'positive', 'instead', 1, 543, 0.0018),
(14373, 'positive', 'night', 1, 543, 0.0018),
(14374, 'positive', 'wai', 1, 543, 0.0018),
(14375, 'positive', 'disappear', 2, 543, 0.0037),
(14376, 'positive', 'daili', 1, 543, 0.0018),
(14377, 'positive', 'first', 1, 543, 0.0018),
(14378, 'positive', 'user', 1, 543, 0.0018),
(14379, 'negative', 'understand', 1, 118, 0.0085),
(14380, 'negative', 'cycl', 1, 118, 0.0085),
(14381, 'negative', 'went', 1, 118, 0.0085),
(14382, 'negative', 'over', 1, 118, 0.0085),
(14383, 'negative', 'help', 2, 118, 0.0169),
(14384, 'negative', 'slept', 1, 118, 0.0085),
(14385, 'negative', 'on', 2, 118, 0.0169),
(14386, 'negative', 'addict', 1, 118, 0.0085),
(14387, 'negative', 'worth', 2, 118, 0.0169),
(14388, 'negative', 'breath', 1, 118, 0.0085),
(14389, 'negative', 'final', 1, 118, 0.0085),
(14390, 'negative', 'itched', 1, 118, 0.0085),
(14391, 'negative', 'menstrual', 1, 118, 0.0085),
(14392, 'negative', 'heart', 1, 118, 0.0085),
(14393, 'negative', 'again', 1, 118, 0.0085),
(14394, 'negative', 'sleep', 2, 118, 0.0169),
(14395, 'negative', 'dosag', 1, 118, 0.0085),
(14396, 'negative', 'non', 1, 118, 0.0085),
(14397, 'negative', 'tri', 1, 118, 0.0085),
(14398, 'negative', 'not', 3, 118, 0.0254),
(14399, 'negative', 'system', 1, 118, 0.0085),
(14400, 'negative', 'dont', 2, 118, 0.0169),
(14401, 'negative', 'discuss', 1, 118, 0.0085),
(14402, 'negative', 'month', 1, 118, 0.0085),
(14403, 'negative', 'readi', 1, 118, 0.0085),
(14404, 'negative', 'try', 1, 118, 0.0085),
(14405, 'negative', 'shorter', 1, 118, 0.0085),
(14406, 'negative', 'face', 1, 118, 0.0085),
(14407, 'negative', 'complex', 1, 118, 0.0085),
(14408, 'negative', 'common', 1, 118, 0.0085),
(14409, 'negative', 'pain', 1, 118, 0.0085),
(14410, 'negative', 'pill', 1, 118, 0.0085),
(14411, 'negative', 'slower', 1, 118, 0.0085),
(14412, 'negative', 'weaker', 1, 118, 0.0085),
(14413, 'negative', 'side', 2, 118, 0.0169),
(14414, 'negative', 'mg', 3, 118, 0.0254),
(14415, 'negative', 'me', 1, 118, 0.0085),
(14416, 'negative', 'want', 1, 118, 0.0085),
(14417, 'negative', 'lime', 1, 118, 0.0085),
(14418, 'negative', 'hour', 2, 118, 0.0169),
(14419, 'negative', 'up', 1, 118, 0.0085),
(14420, 'negative', 'process', 1, 118, 0.0085),
(14421, 'negative', 'stai', 1, 118, 0.0085),
(14422, 'negative', 'experi', 1, 118, 0.0085),
(14423, 'negative', 'experienc', 2, 118, 0.0169),
(14424, 'negative', 'attack', 1, 118, 0.0085),
(14425, 'negative', 'reliev', 1, 118, 0.0085),
(14426, 'negative', 'hate', 1, 118, 0.0085),
(14427, 'negative', 'normal', 1, 118, 0.0085),
(14428, 'negative', 'stupid', 1, 118, 0.0085),
(14429, 'negative', 'took', 1, 118, 0.0085),
(14430, 'negative', 'anxieti', 1, 118, 0.0085),
(14431, 'negative', 'close', 1, 118, 0.0085),
(14432, 'negative', 'medicin', 2, 118, 0.0169),
(14433, 'negative', 'taken', 1, 118, 0.0085),
(14434, 'negative', 'head', 1, 118, 0.0085),
(14435, 'negative', 'plu', 1, 118, 0.0085),
(14436, 'negative', 'work', 1, 118, 0.0085),
(14437, 'negative', 'think', 1, 118, 0.0085),
(14438, 'negative', 'bed', 1, 118, 0.0085),
(14439, 'negative', 'dai', 2, 118, 0.0169),
(14440, 'negative', 'figur', 1, 118, 0.0085),
(14441, 'negative', 'much', 1, 118, 0.0085),
(14442, 'negative', 'scari', 1, 118, 0.0085),
(14443, 'negative', 'stuff', 1, 118, 0.0085),
(14444, 'negative', 'panic', 1, 118, 0.0085),
(14445, 'negative', 'better', 1, 118, 0.0085),
(14446, 'negative', 'emerg', 1, 118, 0.0085),
(14447, 'negative', 'even', 1, 118, 0.0085),
(14448, 'negative', 'make', 1, 118, 0.0085),
(14449, 'negative', 'thing', 1, 118, 0.0085),
(14450, 'negative', 'medic', 3, 118, 0.0254),
(14451, 'negative', 'pound', 1, 118, 0.0085),
(14452, 'negative', 'room', 1, 118, 0.0085),
(14453, 'negative', 'stop', 1, 118, 0.0085),
(14454, 'negative', 'allergi', 1, 118, 0.0085),
(14455, 'negative', 'awai', 1, 118, 0.0085),
(14456, 'negative', 'crazi', 1, 118, 0.0085),
(14457, 'negative', 'terribl', 2, 118, 0.0169),
(14458, 'negative', 'didnt', 3, 118, 0.0254),
(14459, 'negative', 'id', 1, 118, 0.0085),
(14460, 'negative', 'wake', 1, 118, 0.0085),
(14461, 'negative', 'immedi', 1, 118, 0.0085),
(14462, 'negative', 'drug', 1, 118, 0.0085),
(14463, 'negative', 'feel', 2, 118, 0.0169),
(14464, 'negative', 'atarax', 1, 118, 0.0085),
(14465, 'negative', 'mayb', 1, 118, 0.0085),
(14466, 'negative', 'interrupt', 1, 118, 0.0085),
(14467, 'negative', 'two', 1, 118, 0.0085),
(14468, 'negative', 'tablet', 1, 118, 0.0085),
(14469, 'negative', 'effect', 1, 118, 0.0085),
(14470, 'negative', 'felt', 1, 118, 0.0085),
(14471, 'negative', 'allegra', 2, 118, 0.0169),
(14472, 'negative', 'high', 1, 118, 0.0085),
(14473, 'negative', 'forget', 1, 118, 0.0085),
(14474, 'negative', 'couldnt', 1, 118, 0.0085),
(14475, 'negative', 'out', 1, 118, 0.0085);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fullname` varchar(50) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `address` text NOT NULL,
  `email` varchar(100) NOT NULL,
  `contact_no` varchar(12) NOT NULL,
  `user_type` varchar(15) DEFAULT NULL,
  `created_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=31 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fullname`, `username`, `password`, `address`, `email`, `contact_no`, `user_type`, `created_timestamp`) VALUES
(1, 'user1', 'user1', 'user1', 'pune', 'user1@gmail.com', '68564666', 'user', '2014-02-11 12:02:35'),
(3, 'user2', 'user2', 'user2', 'mumbai', 'user2@gmail.com', '685654545', 'pharma', '2014-02-24 12:08:38'),
(23, 'pqr', 'pqr', '123', 'mumbai', 'pqr@stv.com', '4512451245', 'user', '2014-11-18 16:47:00'),
(20, 'abc', 'abc', '123', 'mumbai', 'abc@xyz.com', '4512451245', 'doctor', '2014-11-18 16:40:03'),
(21, 'xyz', 'xyz', '123', 'mumbai', 'xyz@abc.com', '4512451245', 'pharma', '2014-11-18 16:40:26'),
(25, 'user1', 'mmm', 'mmm', 'mumbai', 'abc@xyz.com', '6543126543', 'pharma', '2014-12-10 15:45:07'),
(24, 'nothing', 'new', 'new', 'msdbhfksdk', 'user1@xyz.com', '1245874584', 'doctor', '2014-12-10 15:44:05'),
(26, 'noname', 'noname', 'noname', 'noname', 'abc@xyz.com', '64531298745', 'user', '2014-12-10 15:47:50'),
(27, 'DR1', 'DR1', 'DR1', 'DR1', 'abc@xyz.com', '651166566165', 'doctor', '2014-12-10 16:03:35'),
(28, 'Nothing', 'Nothing', 'Nothing', 'Nothing', 'Nothing@gmail.com', '649873215', 'pharma', '2014-12-10 16:10:24'),
(29, 'sudeep', 'DR2', '123', 'hadapsar', 'sudeep48raj93@gmail.com', '7620683832', 'user', '2015-02-26 11:48:30'),
(30, 'sachitanand singh', 'DR3', '1234', 'pune', 'sachitsingh40@YAHOO.COM', '9422336405', 'user', '2015-02-26 11:51:41');

