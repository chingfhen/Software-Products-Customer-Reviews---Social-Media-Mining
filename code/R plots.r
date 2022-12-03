

# install.packages("rjson")
library("rjson")
feature_importances <- as.data.frame(fromJSON(file="C:\\Users\\tanch\\Documents\\NTU\\NTU Year 4\\Semester 1\\CS4022 - Social Media Mining\\Assignments\\Assignment 2 - Customer Review Mining Project\\data\\feature_importances.json"))
aggregated_importances <- as.data.frame(fromJSON(file="C:\\Users\\tanch\\Documents\\NTU\\NTU Year 4\\Semester 1\\CS4022 - Social Media Mining\\Assignments\\Assignment 2 - Customer Review Mining Project\\data\\aggregated_importances.json"))
tmp_agg = data.frame(Feature.Names = colnames(aggregated_importances), Feature.Importances = c(1465.5, 202.5, 140.75, 135.9271, 85.96354, 79.44792, 12.5, 2.141283))
tfidf_importances <- as.data.frame(fromJSON(file="C:\\Users\\tanch\\Documents\\NTU\\NTU Year 4\\Semester 1\\CS4022 - Social Media Mining\\Assignments\\Assignment 2 - Customer Review Mining Project\\data\\tfidf_importances.json"))
punctuation_importances <- as.data.frame(fromJSON(file="C:\\Users\\tanch\\Documents\\NTU\\NTU Year 4\\Semester 1\\CS4022 - Social Media Mining\\Assignments\\Assignment 2 - Customer Review Mining Project\\data\\punctuation_importances.json"))
topic_similarity_importances <- as.data.frame(fromJSON(file="C:\\Users\\tanch\\Documents\\NTU\\NTU Year 4\\Semester 1\\CS4022 - Social Media Mining\\Assignments\\Assignment 2 - Customer Review Mining Project\\data\\topic_similarity_importances.json"))
sentiment_lexicon_importances <- as.data.frame(fromJSON(file="C:\\Users\\tanch\\Documents\\NTU\\NTU Year 4\\Semester 1\\CS4022 - Social Media Mining\\Assignments\\Assignment 2 - Customer Review Mining Project\\data\\sentiment_lexicon_importances.json"))
other_features_importances <- as.data.frame(fromJSON(file="C:\\Users\\tanch\\Documents\\NTU\\NTU Year 4\\Semester 1\\CS4022 - Social Media Mining\\Assignments\\Assignment 2 - Customer Review Mining Project\\data\\other_features_importances.json"))




library(ggplot2)
# top20 features
p<-ggplot(data=feature_importances[0:20,], aes(fill = Feature.Names,y=reorder(Feature.Names,Feature.Importances), x=Feature.Importances)) +
  geom_bar(stat="identity")+ theme(legend.position = "none")+ylab("Feature Names")
p

p<-ggplot(data=tmp_agg, aes(fill = Feature.Names,y=reorder(Feature.Names,Feature.Importances), x=Feature.Importances)) +
  geom_bar(stat="identity")+ theme(legend.position = "none")+ylab("Feature Names")
p

p<-ggplot(data=tfidf_importances[0:20,], aes(fill = Feature.Names,y=reorder(Feature.Names,Feature.Importances), x=Feature.Importances)) +
  geom_bar(stat="identity")+ theme(legend.position = "none")+ylab("Feature Names")
p

p<-ggplot(data=tail(tfidf_importances, 10), aes(fill = Feature.Names,y=reorder(Feature.Names,Feature.Importances), x=Feature.Importances)) +
  geom_bar(stat="identity")+ theme(legend.position = "none")+ylab("Feature Names")
p

p<-ggplot(data=punctuation_importances, aes(fill = Feature.Names,y=reorder(Feature.Names,Feature.Importances), x=Feature.Importances)) +
  geom_bar(stat="identity")+ theme(legend.position = "none")+ylab("Feature Names")
p

p<-ggplot(data=topic_similarity_importances, aes(fill = Feature.Names,y=reorder(Feature.Names,Feature.Importances), x=Feature.Importances)) +
  geom_bar(stat="identity")+ theme(legend.position = "none")+ylab("Feature Names")
p

p<-ggplot(data=rbind(other_features_importances, sentiment_lexicon_importances), aes(fill = Feature.Names,y=reorder(Feature.Names,Feature.Importances), x=Feature.Importances)) +
  geom_bar(stat="identity")+ theme(legend.position = "none")+ylab("Feature Names")
p





# install.packages("wordcloud")
# library(wordcloud)
# install.packages("RColorBrewer")
# library(RColorBrewer)
# install.packages("wordcloud2")
library(wordcloud2)


words = c('excellent', 'paintshop', 'psp', 'photomatix', 'hdr', 'exposure',
'editing', 'raw', 'print', 'stability', 'merge', 'photo', 'corel',
'poser', 'pricing', 'lt', 'autocad', 'flexible', 'videostudio',
'images', 'effects', 'workflow', 'aftershot', 'processing',
'powerful', 'photography', 'graphic', 'pro', 'painting', 'rating',
'design', 'vocabulary', 'photos', 'mapping', 'range', 'easy',
'videos', 'scene', 'photographer', 'dell', 'pdf', 'stone',
'various', 'capable', 'map', 'competitive', 'alternative',
'useful', 'lightroom', 'camera')
scores = c(0.57983917, 0.37251696, 0.31119803, 0.30699292, 0.2979673 ,
            0.26928598, 0.2620457 , 0.24604209, 0.23496684, 0.2337012 ,
            0.23361686, 0.23257923, 0.22998996, 0.22900747, 0.22866625,
            0.22848658, 0.22213124, 0.219313  , 0.21762054, 0.2157914 ,
            0.21425238, 0.21177663, 0.21171   , 0.21054012, 0.20960383,
            0.20902796, 0.20633905, 0.20627819, 0.19904457, 0.19577254,
            0.192735  , 0.1877584 , 0.18670866, 0.1847395 , 0.18218398,
            0.18156548, 0.18022773, 0.17953601, 0.17672837, 0.17546482,
            0.17484802, 0.17379016, 0.17268878, 0.17252533, 0.17174982,
            0.17114541, 0.17077503, 0.17032501, 0.16953185, 0.16909608)
wordcloud(words = words, freq = scores, min.freq = 1,           
          max.words=200, random.order=FALSE, rot.per=0.35,            
          colors=brewer.pal(8, "Dark2"))

words = c('junk', 'reinstall', 'repair', 'caused', 'crash', 'norton',
          'registry', 'reinstalled', 'fix', 'doctor', 'xp', 'computer',
          'uninstalled', 'crashes', 'bloated', 'forever', 'sorts', 'crashed',
          'viruses', 'cookies', 'utilities', 'problems', 'uninstall',
          'worst', 'micro', 'spyware', 'disk', 'trend', 'recovery',
          'freezes', 'yesterday', 'blue', 'boot', 'symantec', 'errors',
          'death', 'roxio', 'unstable', 'virus', 'had', 'delete', 'garbage',
          'joke', 'system', 'failure', 'uninstalling', 'malware',
          'attempted', 'crap', 'fixes')
scores = c(0.4651946 , 0.3261698 , 0.31090304, 0.27736127, 0.27063802,
           0.2654728 , 0.25916103, 0.2564326 , 0.2505134 , 0.23909393,
           0.22919331, 0.22672138, 0.22087128, 0.22056098, 0.21698764,
           0.21216065, 0.2104588 , 0.20634565, 0.20518942, 0.20467746,
           0.20405616, 0.2039225 , 0.19943619, 0.19940914, 0.19937131,
           0.19698815, 0.19530939, 0.19407289, 0.193488  , 0.18694012,
           0.18651246, 0.18541116, 0.18350151, 0.18249336, 0.17997354,
           0.17909046, 0.17885171, 0.17863017, 0.17775254, 0.17685725,
           0.17615172, 0.17567585, 0.17542659, 0.17454974, 0.17305219,
           0.17301632, 0.17189704, 0.17056797, 0.16822289, 0.16729581)
wordcloud(words = words, freq = scores, min.freq = 1,           
          max.words=200, random.order=FALSE, rot.per=0.35,            
          colors=brewer.pal(8, "Dark2"))

words = c('garbage', 'vista', 'xp', 'driver', 'operating', 'system',
          'windows', 'dell', 'crap', 'processor', 'gigs', 'drivers', 'hp',
          'sp', 'printer', 'hardware', 'microsoft', 'ibm', 'crashes', 'junk',
          'running', 'intel', 'worst', 'secure', 'dual', 'upgraded',
          'upgrade', 'stable', 'sm', 'linux', 'ubuntu', 'hog', 'boots',
          'kaspersky', 'dmarks', 'bloated', 'boot', 'crashed', 'winxp',
          'systems', 'installed', 'computer', 'viruses', 'memory', 'os',
          'downgrade', 'ms', 'ram', 'win', 'crashing')
scores = c(0.43724337, 0.4212749 , 0.3482126 , 0.34367937, 0.30559963,
           0.29257372, 0.24827479, 0.24445419, 0.2397305 , 0.23676814,
           0.23157841, 0.23149455, 0.23015323, 0.22814359, 0.22811   ,
           0.22576353, 0.22207841, 0.2103631 , 0.20902185, 0.20441931,
           0.20433588, 0.20396371, 0.20128606, 0.20096368, 0.1983828 ,
           0.19391584, 0.19225585, 0.1921439 , 0.19204561, 0.19058484,
           0.190391  , 0.18899234, 0.18897499, 0.18888551, 0.1879224 ,
           0.18691517, 0.18536128, 0.18501118, 0.18353336, 0.18326467,
           0.18028139, 0.17779249, 0.17754287, 0.17735404, 0.1770619 ,
           0.17621125, 0.17401978, 0.17217319, 0.17067635, 0.1688239 )
wordcloud(words = words, freq = scores, min.freq = 1,           
          max.words=200, random.order=FALSE, rot.per=0.35,            
          colors=brewer.pal(8, "Dark2"))

words = c('taxes', 'tax', 'turbotax', 'turbo', 'return', 'federal', 'filing',
          'forms', 'taxcut', 'returns', 'state', 'irs', 'deductions',
          'block', 'interview', 'income', 'efile', 'tt', 'deluxe', 'filed',
          'year', 'audit', 'fed', 'prepare', 'rental', 'preparation',
          'property', 'hr', 'form', 'intuit', 'refund', 'schedules',
          'investments', 'last', 'accountant', 'print', 'expenses', 'years',
          'schedule', 'calculations', 'questions', 'willmaker', 'preparing',
          'tier', 'government', 'pay', 'premier', 'filled', 'prices',
          'situation')
scores = c(0.62287074, 0.6135867 , 0.6120643 , 0.5530392 , 0.5354338 ,
           0.52763295, 0.50651175, 0.4914701 , 0.49007857, 0.47121364,
           0.4692604 , 0.46653476, 0.457756  , 0.45584336, 0.45058143,
           0.43339893, 0.42729717, 0.41573155, 0.406407  , 0.40035862,
           0.3861011 , 0.34007123, 0.33320653, 0.33033523, 0.32285506,
           0.3209361 , 0.31021696, 0.30405876, 0.3001624 , 0.29127184,
           0.28286114, 0.2720271 , 0.26907855, 0.25161976, 0.25118575,
           0.23315656, 0.22666   , 0.22558145, 0.2251447 , 0.21737543,
           0.21461596, 0.2071433 , 0.20647503, 0.20457728, 0.20366007,
           0.20090951, 0.20052265, 0.20028852, 0.19688329, 0.19542514)
wordcloud(words = words, freq = scores, min.freq = 1,           
          max.words=200, random.order=FALSE, rot.per=0.35,            
          colors=brewer.pal(8, "Dark2"))

words = c('word', 'wordperfect', 'office', 'excel', 'powerpoint', 'iwork',
          'wp', 'openoffice', 'formatting', 'ms', 'spreadsheets', 'document',
          'spreadsheet', 'student', 'presentations', 'processing', 'quattro',
          'microsoft', 'documents', 'doc', 'reveal', 'docs', 'onenote',
          'tables', 'pdf', 'suite', 'outlook', 'pdfs', 'codes',
          'presentation', 'converting', 'productivity', 'open', 'pages',
          'ribbon', 'formats', 'compatibility', 'html', 'legal', 'publisher',
          'suites', 'perfect', 'applications', 'templates', 'corel',
          'mappoint', 'client', 'processor', 'format', 'exchange')
scores = c(0.58022094, 0.56409794, 0.5554969 , 0.5286479 , 0.4781857 ,
           0.4504434 , 0.43594497, 0.42782664, 0.4152877 , 0.39393663,
           0.3889844 , 0.38691595, 0.37832943, 0.36722723, 0.36277074,
           0.3520433 , 0.35025796, 0.34429276, 0.34396553, 0.32902244,
           0.32553872, 0.31373188, 0.2937014 , 0.28977776, 0.28876257,
           0.28712383, 0.2829748 , 0.28119993, 0.27446848, 0.26429266,
           0.26358292, 0.26318255, 0.25960147, 0.2557982 , 0.25134456,
           0.24756844, 0.2452191 , 0.24108888, 0.23547962, 0.23533061,
           0.22241767, 0.22033781, 0.21971689, 0.2164683 , 0.21641602,
           0.21611579, 0.21093036, 0.2103916 , 0.200787  , 0.19834435)
wordcloud(words = words, freq = scores, min.freq = 1,           
          max.words=200, random.order=FALSE, rot.per=0.35,            
          colors=brewer.pal(8, "Dark2"))

words = c('processor', 'ghz', 'gb', 'duo', 'ram', 'core', 'intel', 'amd',
          'quad', 'pentium', 'minimum', 'bit', 'requirements', 'mb', 'dual',
          'memory', 'nvidia', 'vista', 'dell', 'gigs', 'sp', 'system',
          'running', 'xp', 'specs', 'installation', 'hp', 'avchd', 'gig',
          'usb', 'cpu', 'processors', 'speed', 'drive', 'mpeg', 'installed',
          'hardware', 'windows', 'recommended', 'installing', 'card',
          'higher', 'tb', 'install', 'burning', 'required', 'ssd',
          'computer', 'driver', 'drivers')
scores = c(0.54744005, 0.5350973 , 0.5155299 , 0.5111776 , 0.50445163,
           0.48587835, 0.47373578, 0.43945694, 0.43414953, 0.4265076 ,
           0.41704538, 0.3784751 , 0.37556484, 0.3661806 , 0.34467733,
           0.32492256, 0.32100564, 0.30987924, 0.3003294 , 0.29330337,
           0.28585738, 0.28485715, 0.28078476, 0.27452192, 0.27155286,
           0.26445597, 0.26144406, 0.25543815, 0.25521773, 0.25456592,
           0.24883406, 0.24077433, 0.23642577, 0.23302524, 0.23076877,
           0.22857729, 0.22423102, 0.22352698, 0.21129283, 0.20894152,
           0.2070676 , 0.20518507, 0.20476629, 0.2035987 , 0.20172659,
           0.20161103, 0.19992836, 0.1991781 , 0.19868629, 0.19854997)
wordcloud(words = words, freq = scores, min.freq = 1,           
          max.words=200, random.order=FALSE, rot.per=0.35,            
          colors=brewer.pal(8, "Dark2"))


feature_importances

p<-ggplot(data=head(feature_importances,300), aes(y=reorder(Feature.Names,Feature.Importances), x=Feature.Importances)) +
  geom_bar(stat="identity")+ theme(axis.title.y=element_blank(),
                                   axis.text.y=element_blank(),
                                   axis.ticks.y=element_blank())
p

library(data.table)
performances = data.frame(model = c('Naive Bayes', 'SVM', 'Extra Trees', 'Random Forest', 'LightGBM', "LightGBM-Tuned","SVM-reduced"),
           accuracy = c(0.6591591591591591, 0.39864864864864863, 0.6861861861861862, 0.6944444444444444, 0.7147147147147147, 0.7327327327327328, 0.5442942942942943),
           precision = c(0.6577118194624472, 0.3963233835899371, 0.6832256629200814, 0.6947790734088105, 0.7150671136001732, 0.7297588216685166, 0.5527319463570777),
           recall = c(0.6551565303868646, 0.4057519510960228, 0.6822708733211974, 0.6919117383677683, 0.7129782253606756, 0.7301627148097474, 0.5426161482601309),
           f1 = c(0.6544391945380802, 0.3846397969904471, 0.6817791922825762, 0.6929023913582136, 0.7138621962769728, 0.7296501250848818, 0.5452433606270597))
performances = melt(setDT(performances), id.vars = c("model"), variable.name = "Score")


ggplot(performances, aes(fill=Score, y=reorder(model,value), x=value)) + 
  geom_bar(position="dodge", stat="identity") +
  facet_wrap(~Score) +
  ggtitle("Performance Comparison on Test Set")+
  theme(legend.position="none") +
  xlab("")+ylab("")


dataset = read.csv("C:\\Users\\tanch\\Documents\\NTU\\NTU Year 4\\Semester 1\\CS4022 - Social Media Mining\\Assignments\\Assignment 2 - Customer Review Mining Project\\data\\dataset.csv")



tmp = data.frame(brand = c('Corel', 'Corel', 'Corel', 'Cyberlink', 'Cyberlink', 'Cyberlink', 'H&R Block', 'H&R Block', 'H&R Block', 'Intuit', 'Intuit', 'Intuit', 'Kaspersky', 'Kaspersky', 'Kaspersky', 'McAfee', 'McAfee', 'McAfee', 'Microsoft', 'Microsoft', 'Microsoft', 'Nuance Dragon', 'Nuance Dragon', 'Nuance Dragon', 'Roxio', 'Roxio', 'Roxio', 'Symantec', 'Symantec', 'Symantec'),
           sentiment = c('NEG', 'NEU', 'POS', 'NEG', 'NEU', 'POS', 'NEG', 'NEU', 'POS', 'NEG', 'NEU', 'POS', 'NEG', 'NEU', 'POS', 'NEG', 'NEU', 'POS', 'NEG', 'NEU', 'POS', 'NEG', 'NEU', 'POS', 'NEG', 'NEU', 'POS', 'NEG', 'NEU', 'POS'),
           count = c(60, 167, 142, 24, 41, 42, 36, 41, 46, 260, 203, 189, 41, 32, 65, 30, 52, 38, 313, 230, 151, 39, 49, 23, 46, 53, 16, 156, 116, 164))

ggplot(tmp, aes(fill=sentiment, y=reorder(brand,count), x = count)) + 
  geom_bar(position="fill", stat="identity") + ylab("")

tmp = data.frame(
  topic = c('topic_similarity_0', 'topic_similarity_1', 'topic_similarity_2',
            'topic_similarity_3', 'topic_similarity_4', 'topic_similarity_5',
            'topic_similarity_6', 'topic_similarity_7', 'topic_similarity_8',
            'topic_similarity_9', 'topic_similarity_10', 'topic_similarity_11',
            'topic_similarity_12', 'topic_similarity_13', 'topic_similarity_14',
            'topic_similarity_15', 'topic_similarity_16', 'topic_similarity_17',
            'topic_similarity_18', 'topic_similarity_19', 'topic_similarity_20',
            'topic_similarity_21', 'topic_similarity_22', 'topic_similarity_23',
            'topic_similarity_24', 'topic_similarity_25', 'topic_similarity_26',
            'topic_similarity_27', 'topic_similarity_28', 'topic_similarity_29',
            'topic_similarity_30', 'topic_similarity_31', 'topic_similarity_32',
            'topic_similarity_33', 'topic_similarity_34', 'topic_similarity_35'),
  count = c(605, 573, 455, 330, 216, 206, 156, 123, 119, 110, 110, 106, 102,
            98,  89,  85,  84,  73,  60,  58,  56,  55,  55,  52,  47,  47,
            46,  45,  39,  38,  38,  38,  37,  32,  30,  27)
)
ggplot(tmp, aes(fill=topic, y=reorder(topic,count), x = count)) + 
  geom_bar(stat="identity") + ylab("")+theme(legend.position="none") 


tmp = data.frame(
  sentiment = c('NEG', 'NEG', 'NEG', 'NEG', 'NEG', 'NEG', 'NEG', 'NEG', 'NEG', 'NEG', 'NEG', 'NEG', 'NEG', 'NEG', 'NEG', 'NEG', 'NEG', 'NEG', 'NEG', 'NEG', 'NEG', 'NEG', 'NEG', 'NEG', 'NEG', 'NEG', 'NEG', 'NEG', 'NEG', 'NEG', 'NEG', 'NEG', 'NEG', 'NEG', 'NEG', 'NEG', 'NEU', 'NEU', 'NEU', 'NEU', 'NEU', 'NEU', 'NEU', 'NEU', 'NEU', 'NEU', 'NEU', 'NEU', 'NEU', 'NEU', 'NEU', 'NEU', 'NEU', 'NEU', 'NEU', 'NEU', 'NEU', 'NEU', 'NEU', 'NEU', 'NEU', 'NEU', 'NEU', 'NEU', 'NEU', 'NEU', 'NEU', 'NEU', 'NEU', 'NEU', 'NEU', 'NEU', 'POS', 'POS', 'POS', 'POS', 'POS', 'POS', 'POS', 'POS', 'POS', 'POS', 'POS', 'POS', 'POS', 'POS', 'POS', 'POS', 'POS', 'POS', 'POS', 'POS', 'POS', 'POS', 'POS', 'POS', 'POS', 'POS', 'POS', 'POS', 'POS', 'POS', 'POS', 'POS', 'POS', 'POS', 'POS', 'POS'),
  topic = c('topic_similarity_0', 'topic_similarity_1', 'topic_similarity_10', 'topic_similarity_11', 'topic_similarity_12', 'topic_similarity_13', 'topic_similarity_14', 'topic_similarity_15', 'topic_similarity_16', 'topic_similarity_17', 'topic_similarity_18', 'topic_similarity_19', 'topic_similarity_2', 'topic_similarity_20', 'topic_similarity_21', 'topic_similarity_22', 'topic_similarity_23', 'topic_similarity_24', 'topic_similarity_25', 'topic_similarity_26', 'topic_similarity_27', 'topic_similarity_28', 'topic_similarity_29', 'topic_similarity_3', 'topic_similarity_30', 'topic_similarity_31', 'topic_similarity_32', 'topic_similarity_33', 'topic_similarity_34', 'topic_similarity_35', 'topic_similarity_4', 'topic_similarity_5', 'topic_similarity_6', 'topic_similarity_7', 'topic_similarity_8', 'topic_similarity_9', 'topic_similarity_0', 'topic_similarity_1', 'topic_similarity_10', 'topic_similarity_11', 'topic_similarity_12', 'topic_similarity_13', 'topic_similarity_14', 'topic_similarity_15', 'topic_similarity_16', 'topic_similarity_17', 'topic_similarity_18', 'topic_similarity_19', 'topic_similarity_2', 'topic_similarity_20', 'topic_similarity_21', 'topic_similarity_22', 'topic_similarity_23', 'topic_similarity_24', 'topic_similarity_25', 'topic_similarity_26', 'topic_similarity_27', 'topic_similarity_28', 'topic_similarity_29', 'topic_similarity_3', 'topic_similarity_30', 'topic_similarity_31', 'topic_similarity_32', 'topic_similarity_33', 'topic_similarity_34', 'topic_similarity_35', 'topic_similarity_4', 'topic_similarity_5', 'topic_similarity_6', 'topic_similarity_7', 'topic_similarity_8', 'topic_similarity_9', 'topic_similarity_0', 'topic_similarity_1', 'topic_similarity_10', 'topic_similarity_11', 'topic_similarity_12', 'topic_similarity_13', 'topic_similarity_14', 'topic_similarity_15', 'topic_similarity_16', 'topic_similarity_17', 'topic_similarity_18', 'topic_similarity_19', 'topic_similarity_2', 'topic_similarity_20', 'topic_similarity_21', 'topic_similarity_22', 'topic_similarity_23', 'topic_similarity_24', 'topic_similarity_25', 'topic_similarity_26', 'topic_similarity_27', 'topic_similarity_28', 'topic_similarity_29', 'topic_similarity_3', 'topic_similarity_30', 'topic_similarity_31', 'topic_similarity_32', 'topic_similarity_33', 'topic_similarity_34', 'topic_similarity_35', 'topic_similarity_4', 'topic_similarity_5', 'topic_similarity_6', 'topic_similarity_7', 'topic_similarity_8', 'topic_similarity_9'),
  count = c(160, 92, 45, 22, 69, 14, 15, 39, 33, 17, 15, 13, 159, 35, 11, 10, 10, 3, 28, 9, 28, 7, 8, 200, 18, 8, 6, 2, 9, 3, 63, 105, 117, 69, 20, 18, 204, 254, 41, 41, 18, 27, 52, 35, 31, 36, 21, 23, 138, 16, 18, 22, 34, 10, 11, 9, 5, 8, 21, 72, 6, 16, 15, 8, 7, 3, 80, 68, 27, 27, 69, 7, 241, 227, 24, 43, 15, 57, 22, 11, 20, 20, 24, 22, 158, 5, 26, 23, 8, 34, 8, 28, 12, 24, 9, 58, 14, 14, 16, 22, 14, 21, 73, 33, 12, 27, 30, 85),
  pos_frac = c(0.39834710743801655, 0.3961605584642234, 0.21818181818181817, 0.4056603773584906, 0.14705882352941177, 0.5816326530612245, 0.24719101123595505, 0.12941176470588237, 0.23809523809523808, 0.273972602739726, 0.4, 0.3793103448275862, 0.34725274725274724, 0.08928571428571429, 0.4727272727272727, 0.41818181818181815, 0.15384615384615385, 0.723404255319149, 0.1702127659574468, 0.6086956521739131, 0.26666666666666666, 0.6153846153846154, 0.23684210526315788, 0.17575757575757575, 0.3684210526315789, 0.3684210526315789, 0.43243243243243246, 0.6875, 0.4666666666666667, 0.7777777777777778, 0.33796296296296297, 0.16019417475728157, 0.07692307692307693, 0.21951219512195122, 0.25210084033613445, 0.7727272727272727, 0.39834710743801655, 0.3961605584642234, 0.21818181818181817, 0.4056603773584906, 0.14705882352941177, 0.5816326530612245, 0.24719101123595505, 0.12941176470588237, 0.23809523809523808, 0.273972602739726, 0.4, 0.3793103448275862, 0.34725274725274724, 0.08928571428571429, 0.4727272727272727, 0.41818181818181815, 0.15384615384615385, 0.723404255319149, 0.1702127659574468, 0.6086956521739131, 0.26666666666666666, 0.6153846153846154, 0.23684210526315788, 0.17575757575757575, 0.3684210526315789, 0.3684210526315789, 0.43243243243243246, 0.6875, 0.4666666666666667, 0.7777777777777778, 0.33796296296296297, 0.16019417475728157, 0.07692307692307693, 0.21951219512195122, 0.25210084033613445, 0.7727272727272727, 0.39834710743801655, 0.3961605584642234, 0.21818181818181817, 0.4056603773584906, 0.14705882352941177, 0.5816326530612245, 0.24719101123595505, 0.12941176470588237, 0.23809523809523808, 0.273972602739726, 0.4, 0.3793103448275862, 0.34725274725274724, 0.08928571428571429, 0.4727272727272727, 0.41818181818181815, 0.15384615384615385, 0.723404255319149, 0.1702127659574468, 0.6086956521739131, 0.26666666666666666, 0.6153846153846154, 0.23684210526315788, 0.17575757575757575, 0.3684210526315789, 0.3684210526315789, 0.43243243243243246, 0.6875, 0.4666666666666667, 0.7777777777777778, 0.33796296296296297, 0.16019417475728157, 0.07692307692307693, 0.21951219512195122, 0.25210084033613445, 0.7727272727272727)
  )

ggplot(tmp, aes(fill=sentiment, y=reorder(topic,pos_frac), x = count)) + 
  geom_bar(position="fill", stat="identity") + ylab("")


tmp_sim = read.csv("C:\\Users\\tanch\\Documents\\NTU\\NTU Year 4\\Semester 1\\CS4022 - Social Media Mining\\Assignments\\Assignment 2 - Customer Review Mining Project\\data\\topic_similarity_head.csv")

readClipboard()


predictions = read.csv("C:\\Users\\tanch\\Documents\\NTU\\NTU Year 4\\Semester 1\\CS4022 - Social Media Mining\\Assignments\\Assignment 2 - Customer Review Mining Project\\data\\predictions.csv")
library(caret)
confusionMatrix(
  factor(predictions[,"pred"]),
  factor(predictions[,"true"])  )



install.packages("ROCR")
library("ROCR")

pred <- prediction(predictions$pred, predictions$true)
perf <- performance(pred,"tpr","fpr")
plot(perf,colorize=TRUE)


words = c('winzip', 'zip', 'compress', 'compression', 'cloud', 'files',
          'dropbox', 'file', 'resize', 'formats', 'send', 'skydrive',
          'storage', 'doc', 'permission', 'explorer', 'states', 'reduced',
          'stored', 'onedrive', 'open', 'ribbon', 'drag', 'upload', 'size',
          'local', 'google', 'clicked', 'displays', 'utility', 'pdf',
          'facebook', 'convert', 'folder', 'shown', 'format', 'large',
          'choosing', 'wizard', 'opens', 'supports', 'sensitive', 'sharing',
          'popular', 'within', 'backup', 'word', 'powerpoint', 'share',
          'images')
scores = c(0.75574833, 0.71922576, 0.608237  , 0.539257  , 0.37482032,
           0.3722156 , 0.36355585, 0.36267588, 0.3361689 , 0.29262796,
           0.2920932 , 0.28457922, 0.25122288, 0.2472479 , 0.24693766,
           0.24321063, 0.23814355, 0.22912066, 0.22172424, 0.22085428,
           0.21997923, 0.21635358, 0.2161627 , 0.21479782, 0.21425037,
           0.21090057, 0.21030644, 0.20913309, 0.20169716, 0.20051022,
           0.19840628, 0.19678637, 0.19564688, 0.19413081, 0.19285734,
           0.18985538, 0.18974474, 0.18662362, 0.18593043, 0.18575785,
           0.1825258 , 0.18040085, 0.17828064, 0.17814434, 0.17809837,
           0.17335854, 0.17309776, 0.17233042, 0.17198656, 0.17010853)
wordcloud(words = words, freq = scores, min.freq = 1,           
          max.words=200, random.order=FALSE, rot.per=0.35,            
          colors=brewer.pal(8, "Dark2"))


words = c('video', 'editing', 'movie', 'photo', 'videos', 'videostudio',
          'photoshop', 'effects', 'studio', 'movies', 'audio', 'elements',
          'editor', 'animation', 'transitions', 'paint', 'pinnacle', 'corel',
          'titles', 'capture', 'paintshop', 'adobe', 'artistic', 'clips',
          'drawing', 'motion', 'cyberlink', 'painting', 'youtube',
          'photography', 'brushes', 'imovie', 'amateur', 'dvd', 'film',
          'photos', 'timeline', 'burning', 'tools', 'painter', 'music',
          'tutorials', 'rendering', 'avi', 'powerdirector', 'poser')
scores = c(0.502509  , 0.4856944 , 0.43260178, 0.41479388, 0.40530023,
           0.39919716, 0.39555198, 0.39400178, 0.39241368, 0.38247675,
           0.3760726 , 0.3729896 , 0.36109504, 0.35648575, 0.35329115,
           0.35293737, 0.35026526, 0.34955552, 0.34946382, 0.34835732,
           0.34739426, 0.34696093, 0.34491837, 0.344414  , 0.34371236,
           0.340202  , 0.33583915, 0.33217067, 0.33080935, 0.32985416,
           0.3281926 , 0.32611555, 0.32304418, 0.32253012, 0.32199782,
           0.31970182, 0.31874034, 0.3184304 , 0.3178625 , 0.31658176,
           0.3081419 , 0.30504298, 0.30439675, 0.3023507 , 0.3022281 ,
           0.30153573)
wordcloud(words = words, freq = scores, min.freq = 1,           
          max.words=200, random.order=FALSE, rot.per=0.35,            
          colors=brewer.pal(8, "Dark2"))

