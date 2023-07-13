import 'package:flutter/material.dart';

import '../details/detailed_crop_screen.dart';

class CropInfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crop Info'),
      ),
      body: Container(
      decoration: BoxDecoration(
    gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
      colors: [
        Color(0xFFFFFFFF), // Hex value: #66FF33 (green)

        Color(0xFF86E591), // Hex value: #3366FF (blue)
      ],
    ),
    ),
    child: GridView.count(
    crossAxisCount: 2,
    padding: EdgeInsets.all(16.0),
    childAspectRatio: 0.9,
    mainAxisSpacing: 20.0,
    crossAxisSpacing: 20.0,
    children: [
          CropOption(
            title: 'Rice',
            image: AssetImage('images/rice.jpeg'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CropDetailsScreen(
                    cropName: 'Rice',
                    imagePath: 'images/rice.jpeg',
                    cropInfo: 'तांदूळ ( Rice ) हे एक धान्य आहे. शेतातून मिळणाऱ्या तांदळावर एक पापुद्रा-साळ असते. साळीसकटच्या तांदळाला भात म्हणतात, त्यामुळे तांदळाच्या शेतीला भातशेती म्हणतात. खाण्यासाठी तांदूळ शिजवून मऊ करावा लागतो; अशा शिजलेल्या तांदळालाही भात (हिंदीत चावल) म्हणतात. \n → भात हे तृणधान्य आहे. म्हणजे हे एक प्रकारचे गवत आहे. पण भाताचे वैशिष्ठ्य असे आहे की तो दोनदा पेरावा लागतो. \n प्रथम भात पेरण्यांसाठी जमीन नांगरून घेतात. त्यावर मजूरांकडून भाताची बियाणे फेकली जातात. \n→ काही दिवसांनी रोपे ६ इंचांपर्यंत वाढली की दुसरीकडे चौकोनी शेताच्या तुकड्यास समतळ करून चोहिकडे मातीचा बंधारा करून त्यात पाणी भरून ठेवतात आणि खुडलेली रोपे त्यात पुन्हा पेरतात... \n → पावसाळ्यातच हे पिक येते त्यामुळे रोपांना पाणथळ जमीन मिळते. नाहीतर जलसिंचन करून शेत पाण्याने भरलेले ठेवावे लागते. \n→ सप्टेंबर ऑक्टोबर मध्ये साळी तांदूळाच्या लोंब्या, किंवा कणीस] तयार होतात. नंतर कापणी आणि मळणी यंत्राने पूर्ण रोप काढून लोंब्या वेगळ्या करतात. रोपांचे धांडे गुरांना खाण्यास किंवा शेतात पसरण्यास उपयोगी होतात. \n→ तांदूळ मग साळीतून वेगळा काढण्यासाठी पाखडला जातो. त्याला हातसडीचे तांदूळ म्हणतात. हे काम बहुतेक वेळा मजूर बायांकडून केले जाते. पण हा तांदूळ मळकट किंवा लाल दिसतो. व्यापारासाठी यंत्रात पॉलीश केलेला तांदूळ घेतात. त्यामध्ये यंत्रात साली काढून टाकून पुन्हा फिरविले जाते कारण तांदूळाच्या फोलपटात {ब्रान} तेल असते त्यामुळे लालसर रंग येतो. हा तांदूळ ब्राउन तांदूळ म्हणून पौष्टिक म्हणून वापरला जातो. \n→ पांढरा शुभ्र तांदूळ मिळवण्यास त्याला पॉलीश केले जाते. आणि फोलपटापासून तेल बनवले जाते. सध्या हे तेल कमी कॅलरी आणि पौष्टिक म्हणून आपण वापरतो पण ही फोलपटे अमेरिकेत गुरांना खायला दिल जातात.',
                    cropGrowth: 'Hello',
                    cropUrl: 'https://krishi.maharashtra.gov.in/Site/Home/CategoryContent.aspx?ID=2a4735c0-8636-496f-af1f-6add75684d45',
                  ),
                ),
              );
            }, iconColor: Colors.white,
          ),
          // CropOption(
          //   title: 'Rice',
          //   icon: Icons.grass,
          //   color: Colors.amber,
          //   iconColor: Colors.white,
          //   onTap: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //         builder: (context) => const CropDetailsScreen(
          //           cropName: 'Rice',
          //           imagePath: 'images/rice.jpeg',
          //           cropInfo: 'Rice is a staple crop...',
          //         ),
          //       ),
          //     );
          //   },
          // ),

          CropOption(
            title: 'Wheat',
            image: AssetImage('images/wheat.jpeg'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CropDetailsScreen(
                    cropName: 'Wheat',
                    imagePath: 'images/wheat.jpeg',
                    cropInfo: 'जमिनीची तयारी: पहिली चरण म्हणजे तळबळीची देखील तयारी करणे. तळबळी हलकी व मुलायम असावी. \n तळबळीमध्ये अविरत पाणी वाहून द्यावे. \nप्रत्येक ३० एकरावरील २५०-३०० लिटर पाणी द्यावे. वरील चरणे करण्यापूर्वी जमिनीला मदत करण्यासाठी चकत्ता आणि खोलापात्रे वापरावे. \nबियाणे वितरण: बियाणे वितरणासाठी ५०-६० किलोग्राम्स प्रति एकर वापरावे. \nबियाणे जमिनीवर अनुकंपा करून वितरावे. बियाणे वितरताना सावधानीपूर्वक नियमित अंतरावर टाकावे. \nउगवणी: बियाणे वितरल्यानंतर प्राथमिक पाणीकाढणी करावी. \nउगवणीसाठी जमिनीवर ४-६ सेमीची तळबळी करावी. बागायतील अंतरावर १५०-२०० किलोग्राम यूरिया द्यावे. \nयूरिया देण्यापूर्वी प्राथमिक उपयोगासाठी १०० किलोग्राम दाटणे वापरावे. \nदेखभाल: वरील चरणे करण्यापूर्वी आपल्या विविध उपकरणांची मांडणी करावी. \nपाने दिसताना आपल्या प्रश्नांसाठी व्हेटील बुटांची नियमित तपास करावी. \nआरोग्यासाठी आवडता रोगनाशक वापरावा. \nपाणी प्रबंधन: उगवणीच्या वेळेत जमिनीला पर्यायी पाणी द्यावे. पाणीच्या प्रमाणांची नियमित तपास करावी. \nजमिनीच्या उपयोगासाठी प्रत्येक २५-३० एकरावरील २५०-३०० लिटर पाणी द्यावे. \nपानांची कापणी: या शृंगावर ध्यान द्या की पाने पुर्णतः बांधल्या जाऊ नये. खरोखरची पाने कापल्यास गोड उत्पादन मिळवता येईल. \nपक्षांची नियंत्रण: फसली शेतीत किंवा खेतीतील पक्षांची नियंत्रण करण्यासाठी प्राणीकीटनाशक वापरावे. \nपाण्याची प्रगासपटी: शेतकऱ्यांनी प्रत्येक वर्षी पाण्याची प्रगासपटी बनवावी. पानाची गवत: शेतकऱ्यांनी प्रत्येक वर्षी पानांची गवत करावी.',
                    cropGrowth: 'Checking ON TAP',
                    cropUrl: 'google.com',
                  ),
                ),
              );
            }, iconColor: Colors.white,
          ),
          CropOption(
            title: 'Cotton',
            image: AssetImage('images/cotton.png'),
            onTap: () {
    Navigator.push(
    context,
      MaterialPageRoute(
        builder: (context) => const CropDetailsScreen(
            cropName: 'Cotton',
            imagePath: 'images/cotton.png',
            cropInfo: 'जिन्नाची माहिती: कापूस जिंकते ही एक वनस्पती आहे ज्याची फाईबर प्रमुख मोठ्या असतात.\nत्याच्या वैज्ञानिक नावाने गॉसिपियम आर्बोरियम हे म्हणतात.\nया वनस्पतीत सध्या अनेक रंगाच्या फाईबरची प्रमुख जात उत्पन्न झाल्या आहेत.\nजी फाईबर आहेत, ती थोडी वजनी आहे आणि जी गरमीची प्राप्ती असते, ती थोडी जलनिकरण करते.\nत्याच्या बालगंधाचे प्रयोग लहान मुलांपासून वृद्धांपर्यंत विशेषत: खाली वापरले जातात.\nत्याचा उत्पादन विशेषतः शेतातील खोडाखोडी क्षेत्रातील उच्च गरमी, न्यूनतम वर्षगाठी, किंवा गरज, रासायनिक प्रक्रियांच्या उच्च नियंत्रणाने करण्यात येत नाही.\nएका संपूर्ण वर्षी फुलांची उगवणी होते.\nप्रत्येक फुलाच्या वर्तुळाच्या ठिकाणी दोन बीजे वसतीत असतात.\nजर तुम्हाला अजूनही काही वाचणं आवडतं',
            cropGrowth: 'भारतात कापूस प्रमुखपणे दक्षिण भारतात प्रवासी जिंकतो. कापूसाची उगवणी वर्षातील प्रवासी संक्रमणाने होते.\nकापूसासाठी उत्तम मृदा होऊन दक्षिण भारतातील मराठवाडा, दक्षिण मध्य महाराष्ट्र, हैदराबाद, गुंटूर, नागपूर आणि बंगलूर या क्षेत्रातील उच्च शेतीचे क्षेत्र आहे.\nकापूस सध्या भारतातील विविध क्षेत्रांत उगवणी होत असल्याने उगवणीच्या वेळा यांची मुख्यप्रमाणे संक्रमण यांची नियंत्रणे, वर्षातील वर आणि वणसामान्य संभारावर अवलंबून राहावे लागते.\nउगवणीपूर्वी कापूसासाठी शुभ भूमितळे परदेशी क्षेत्र निवडावी, ती सुरेख आणि आर्द्र असावी आणावाने गॉसिपियम आर्बोरियम हे म्हणतात. या वनस्पतीत सध्या अनेक रंगाच्या फाईबरची प्रमुख जात उत्पन्न झाल्या आहेत. जी फाईबर आहेत, ती थोडी वजनी आहे आणि जी गरमीची प्राप्ती असते, ती थोडी जलनिकरण करते. त्याच्या बालगंधाचे प्रयोग लहान मुलांपासून वृद्धांपर्यंत विशेषत: खाली वापरले जातात. त्याचा उत्पादन विशेषतः शेतातील खोडाखोडी क्षेत्रातील उच्च गरमी, न्यूनतम वर्षगाठी, किंवा गरज, रासायनिक प्रक्रियांच्या उच्च नियंत्रणाने करण्यात येत नाही. एका संपूर्ण वर्षी फुलांची उगवणी होते. प्रत्येक फुलाच्या वर्तुळाच्या ठिकाणी दोन बीजे वसतीत असतात. जर तुम्हाला अजूनही काही वाचणं आवडतं असेल तर मला जरूर सांपडा. धन्यवाद!',
          cropUrl: 'google.com',
        ),
      ),

    );
              }, iconColor: Colors.white,
          ),
          CropOption(
            title: 'Sugarcane',
            image: AssetImage('images/sugarcane.jpeg'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CropDetailsScreen(
                    cropName: 'Sugarcane',
                    imagePath: 'images/sugarcane.jpeg',
                    cropInfo:  'शर्करा (साखरी उद्यानी) ही वनस्पती खास तात्पुरत्या मधूर रसासाठी वापरली जाते\n ती आर्थिक दृष्ट्या संशोधनांच्या आधारे महत्त्वाची वनस्पती म्हणून ओळखली जाते\n शर्करेचे उत्पादन साखर आणि विविध शर्करा विषयक आहे\n साखरी उद्यानीत साखरीची वाढवणूक करण्यासाठी उचित जलदाणी, उपयुक्त मातीची तयारी, पाने आणि आर्द्रता, तात्काळीन वृद्धीकारक अवस्था, उच्च तापमान, प्रादुर्भाव, दशकोंच्या काळात एक्रांत संक्रमित वनस्पतींची टाकण्याच्या तीव्र प्रवळ प्रतिष्ठा, आपोआपात आणि शोधांचे अभाव यांचे पर्यायानुसार अर्ज घेतले जाते\n शर्करा उत्पादनाचा काम जास्तीत जास्त आर्थिक महत्त्वाचा आहे, व ती खाद्य, पेय, आरोग्य, सौंदर्य, औषधी, उर्जा, आणि उद्योजकतेसाठी वापरली जाते ',
                    cropGrowth: '',
                    cropUrl: 'google.com',
                  ),
                ),
              );
            }, iconColor: Colors.white,
          ),
          CropOption(
            title: 'Maize',
            image: AssetImage('images/maize.png'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CropDetailsScreen(
                    cropName: 'Wheat',
                    imagePath: 'images/maize.png',
                    cropInfo: 'जमिनीची तयारी: पहिली चरण म्हणजे तळबळीची देखील तयारी करणे. तळबळी हलकी व मुलायम असावी. \n तळबळीमध्ये अविरत पाणी वाहून द्यावे. \nप्रत्येक ३० एकरावरील २५०-३०० लिटर पाणी द्यावे. वरील चरणे करण्यापूर्वी जमिनीला मदत करण्यासाठी चकत्ता आणि खोलापात्रे वापरावे. \nबियाणे वितरण: बियाणे वितरणासाठी ५०-६० किलोग्राम्स प्रति एकर वापरावे. \nबियाणे जमिनीवर अनुकंपा करून वितरावे. बियाणे वितरताना सावधानीपूर्वक नियमित अंतरावर टाकावे. \nउगवणी: बियाणे वितरल्यानंतर प्राथमिक पाणीकाढणी करावी. \nउगवणीसाठी जमिनीवर ४-६ सेमीची तळबळी करावी. बागायतील अंतरावर १५०-२०० किलोग्राम यूरिया द्यावे. \nयूरिया देण्यापूर्वी प्राथमिक उपयोगासाठी १०० किलोग्राम दाटणे वापरावे. \nदेखभाल: वरील चरणे करण्यापूर्वी आपल्या विविध उपकरणांची मांडणी करावी. \nपाने दिसताना आपल्या प्रश्नांसाठी व्हेटील बुटांची नियमित तपास करावी. \nआरोग्यासाठी आवडता रोगनाशक वापरावा. \nपाणी प्रबंधन: उगवणीच्या वेळेत जमिनीला पर्यायी पाणी द्यावे. पाणीच्या प्रमाणांची नियमित तपास करावी. \nजमिनीच्या उपयोगासाठी प्रत्येक २५-३० एकरावरील २५०-३०० लिटर पाणी द्यावे. \nपानांची कापणी: या शृंगावर ध्यान द्या की पाने पुर्णतः बांधल्या जाऊ नये. खरोखरची पाने कापल्यास गोड उत्पादन मिळवता येईल. \nपक्षांची नियंत्रण: फसली शेतीत किंवा खेतीतील पक्षांची नियंत्रण करण्यासाठी प्राणीकीटनाशक वापरावे. \nपाण्याची प्रगासपटी: शेतकऱ्यांनी प्रत्येक वर्षी पाण्याची प्रगासपटी बनवावी. पानाची गवत: शेतकऱ्यांनी प्रत्येक वर्षी पानांची गवत करावी.',
                    cropGrowth: 'Checking ON TAP',
                    cropUrl: 'google.com',
                  ),
                ),
              );
            }, iconColor: Colors.white,
          ),
          CropOption(
            title: 'Potato',
            image: AssetImage('images/potato.png'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CropDetailsScreen(
                    cropName: 'Wheat',
                    imagePath: 'images/potato.png',
                    cropInfo: 'जमिनीची तयारी: पहिली चरण म्हणजे तळबळीची देखील तयारी करणे. तळबळी हलकी व मुलायम असावी. \n तळबळीमध्ये अविरत पाणी वाहून द्यावे. \nप्रत्येक ३० एकरावरील २५०-३०० लिटर पाणी द्यावे. वरील चरणे करण्यापूर्वी जमिनीला मदत करण्यासाठी चकत्ता आणि खोलापात्रे वापरावे. \nबियाणे वितरण: बियाणे वितरणासाठी ५०-६० किलोग्राम्स प्रति एकर वापरावे. \nबियाणे जमिनीवर अनुकंपा करून वितरावे. बियाणे वितरताना सावधानीपूर्वक नियमित अंतरावर टाकावे. \nउगवणी: बियाणे वितरल्यानंतर प्राथमिक पाणीकाढणी करावी. \nउगवणीसाठी जमिनीवर ४-६ सेमीची तळबळी करावी. बागायतील अंतरावर १५०-२०० किलोग्राम यूरिया द्यावे. \nयूरिया देण्यापूर्वी प्राथमिक उपयोगासाठी १०० किलोग्राम दाटणे वापरावे. \nदेखभाल: वरील चरणे करण्यापूर्वी आपल्या विविध उपकरणांची मांडणी करावी. \nपाने दिसताना आपल्या प्रश्नांसाठी व्हेटील बुटांची नियमित तपास करावी. \nआरोग्यासाठी आवडता रोगनाशक वापरावा. \nपाणी प्रबंधन: उगवणीच्या वेळेत जमिनीला पर्यायी पाणी द्यावे. पाणीच्या प्रमाणांची नियमित तपास करावी. \nजमिनीच्या उपयोगासाठी प्रत्येक २५-३० एकरावरील २५०-३०० लिटर पाणी द्यावे. \nपानांची कापणी: या शृंगावर ध्यान द्या की पाने पुर्णतः बांधल्या जाऊ नये. खरोखरची पाने कापल्यास गोड उत्पादन मिळवता येईल. \nपक्षांची नियंत्रण: फसली शेतीत किंवा खेतीतील पक्षांची नियंत्रण करण्यासाठी प्राणीकीटनाशक वापरावे. \nपाण्याची प्रगासपटी: शेतकऱ्यांनी प्रत्येक वर्षी पाण्याची प्रगासपटी बनवावी. पानाची गवत: शेतकऱ्यांनी प्रत्येक वर्षी पानांची गवत करावी.',
                    cropGrowth: 'Checking ON TAP',
                    cropUrl: 'google.com',
                  ),
                ),
              );
            }, iconColor: Colors.white,
          ),
          CropOption(
            title: 'Tomato',
            image: AssetImage('images/tomato.png'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CropDetailsScreen(
                    cropName: 'Wheat',
                    imagePath: 'images/tomato.png',
                    cropInfo: 'जमिनीची तयारी: पहिली चरण म्हणजे तळबळीची देखील तयारी करणे. तळबळी हलकी व मुलायम असावी. \n तळबळीमध्ये अविरत पाणी वाहून द्यावे. \nप्रत्येक ३० एकरावरील २५०-३०० लिटर पाणी द्यावे. वरील चरणे करण्यापूर्वी जमिनीला मदत करण्यासाठी चकत्ता आणि खोलापात्रे वापरावे. \nबियाणे वितरण: बियाणे वितरणासाठी ५०-६० किलोग्राम्स प्रति एकर वापरावे. \nबियाणे जमिनीवर अनुकंपा करून वितरावे. बियाणे वितरताना सावधानीपूर्वक नियमित अंतरावर टाकावे. \nउगवणी: बियाणे वितरल्यानंतर प्राथमिक पाणीकाढणी करावी. \nउगवणीसाठी जमिनीवर ४-६ सेमीची तळबळी करावी. बागायतील अंतरावर १५०-२०० किलोग्राम यूरिया द्यावे. \nयूरिया देण्यापूर्वी प्राथमिक उपयोगासाठी १०० किलोग्राम दाटणे वापरावे. \nदेखभाल: वरील चरणे करण्यापूर्वी आपल्या विविध उपकरणांची मांडणी करावी. \nपाने दिसताना आपल्या प्रश्नांसाठी व्हेटील बुटांची नियमित तपास करावी. \nआरोग्यासाठी आवडता रोगनाशक वापरावा. \nपाणी प्रबंधन: उगवणीच्या वेळेत जमिनीला पर्यायी पाणी द्यावे. पाणीच्या प्रमाणांची नियमित तपास करावी. \nजमिनीच्या उपयोगासाठी प्रत्येक २५-३० एकरावरील २५०-३०० लिटर पाणी द्यावे. \nपानांची कापणी: या शृंगावर ध्यान द्या की पाने पुर्णतः बांधल्या जाऊ नये. खरोखरची पाने कापल्यास गोड उत्पादन मिळवता येईल. \nपक्षांची नियंत्रण: फसली शेतीत किंवा खेतीतील पक्षांची नियंत्रण करण्यासाठी प्राणीकीटनाशक वापरावे. \nपाण्याची प्रगासपटी: शेतकऱ्यांनी प्रत्येक वर्षी पाण्याची प्रगासपटी बनवावी. पानाची गवत: शेतकऱ्यांनी प्रत्येक वर्षी पानांची गवत करावी.',
                    cropGrowth: 'Checking ON TAP',
                    cropUrl: 'google.com',
                  ),
                ),
              );
            }, iconColor: Colors.white,
          ),
          CropOption(
            title: 'Onion',
            image: AssetImage('images/onion.png'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CropDetailsScreen(
                    cropName: 'Wheat',
                    imagePath: 'images/wheat.jpeg',
                    cropInfo: 'जमिनीची तयारी: पहिली चरण म्हणजे तळबळीची देखील तयारी करणे. तळबळी हलकी व मुलायम असावी. \n तळबळीमध्ये अविरत पाणी वाहून द्यावे. \nप्रत्येक ३० एकरावरील २५०-३०० लिटर पाणी द्यावे. वरील चरणे करण्यापूर्वी जमिनीला मदत करण्यासाठी चकत्ता आणि खोलापात्रे वापरावे. \nबियाणे वितरण: बियाणे वितरणासाठी ५०-६० किलोग्राम्स प्रति एकर वापरावे. \nबियाणे जमिनीवर अनुकंपा करून वितरावे. बियाणे वितरताना सावधानीपूर्वक नियमित अंतरावर टाकावे. \nउगवणी: बियाणे वितरल्यानंतर प्राथमिक पाणीकाढणी करावी. \nउगवणीसाठी जमिनीवर ४-६ सेमीची तळबळी करावी. बागायतील अंतरावर १५०-२०० किलोग्राम यूरिया द्यावे. \nयूरिया देण्यापूर्वी प्राथमिक उपयोगासाठी १०० किलोग्राम दाटणे वापरावे. \nदेखभाल: वरील चरणे करण्यापूर्वी आपल्या विविध उपकरणांची मांडणी करावी. \nपाने दिसताना आपल्या प्रश्नांसाठी व्हेटील बुटांची नियमित तपास करावी. \nआरोग्यासाठी आवडता रोगनाशक वापरावा. \nपाणी प्रबंधन: उगवणीच्या वेळेत जमिनीला पर्यायी पाणी द्यावे. पाणीच्या प्रमाणांची नियमित तपास करावी. \nजमिनीच्या उपयोगासाठी प्रत्येक २५-३० एकरावरील २५०-३०० लिटर पाणी द्यावे. \nपानांची कापणी: या शृंगावर ध्यान द्या की पाने पुर्णतः बांधल्या जाऊ नये. खरोखरची पाने कापल्यास गोड उत्पादन मिळवता येईल. \nपक्षांची नियंत्रण: फसली शेतीत किंवा खेतीतील पक्षांची नियंत्रण करण्यासाठी प्राणीकीटनाशक वापरावे. \nपाण्याची प्रगासपटी: शेतकऱ्यांनी प्रत्येक वर्षी पाण्याची प्रगासपटी बनवावी. पानाची गवत: शेतकऱ्यांनी प्रत्येक वर्षी पानांची गवत करावी.',
                    cropGrowth: 'Checking ON TAP',
                    cropUrl: 'google.com',
                  ),
                ),
              );
            }, iconColor: Colors.white,
          ),
          CropOption(
            title: 'Mango',
            image: AssetImage('images/mango.png'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CropDetailsScreen(
                    cropName: 'Wheat',
                    imagePath: 'images/wheat.jpeg',
                    cropInfo: 'जमिनीची तयारी: पहिली चरण म्हणजे तळबळीची देखील तयारी करणे. तळबळी हलकी व मुलायम असावी. \n तळबळीमध्ये अविरत पाणी वाहून द्यावे. \nप्रत्येक ३० एकरावरील २५०-३०० लिटर पाणी द्यावे. वरील चरणे करण्यापूर्वी जमिनीला मदत करण्यासाठी चकत्ता आणि खोलापात्रे वापरावे. \nबियाणे वितरण: बियाणे वितरणासाठी ५०-६० किलोग्राम्स प्रति एकर वापरावे. \nबियाणे जमिनीवर अनुकंपा करून वितरावे. बियाणे वितरताना सावधानीपूर्वक नियमित अंतरावर टाकावे. \nउगवणी: बियाणे वितरल्यानंतर प्राथमिक पाणीकाढणी करावी. \nउगवणीसाठी जमिनीवर ४-६ सेमीची तळबळी करावी. बागायतील अंतरावर १५०-२०० किलोग्राम यूरिया द्यावे. \nयूरिया देण्यापूर्वी प्राथमिक उपयोगासाठी १०० किलोग्राम दाटणे वापरावे. \nदेखभाल: वरील चरणे करण्यापूर्वी आपल्या विविध उपकरणांची मांडणी करावी. \nपाने दिसताना आपल्या प्रश्नांसाठी व्हेटील बुटांची नियमित तपास करावी. \nआरोग्यासाठी आवडता रोगनाशक वापरावा. \nपाणी प्रबंधन: उगवणीच्या वेळेत जमिनीला पर्यायी पाणी द्यावे. पाणीच्या प्रमाणांची नियमित तपास करावी. \nजमिनीच्या उपयोगासाठी प्रत्येक २५-३० एकरावरील २५०-३०० लिटर पाणी द्यावे. \nपानांची कापणी: या शृंगावर ध्यान द्या की पाने पुर्णतः बांधल्या जाऊ नये. खरोखरची पाने कापल्यास गोड उत्पादन मिळवता येईल. \nपक्षांची नियंत्रण: फसली शेतीत किंवा खेतीतील पक्षांची नियंत्रण करण्यासाठी प्राणीकीटनाशक वापरावे. \nपाण्याची प्रगासपटी: शेतकऱ्यांनी प्रत्येक वर्षी पाण्याची प्रगासपटी बनवावी. पानाची गवत: शेतकऱ्यांनी प्रत्येक वर्षी पानांची गवत करावी.',
                    cropGrowth: 'Checking ON TAP',
                    cropUrl: 'google.com',
                  ),
                ),
              );
            }, iconColor: Colors.white,
          ),
          CropOption(
            title: 'Banana',
            image: AssetImage('images/banana.png'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CropDetailsScreen(
                    cropName: 'Wheat',
                    imagePath: 'images/wheat.jpeg',
                    cropInfo: 'जमिनीची तयारी: पहिली चरण म्हणजे तळबळीची देखील तयारी करणे. तळबळी हलकी व मुलायम असावी. \n तळबळीमध्ये अविरत पाणी वाहून द्यावे. \nप्रत्येक ३० एकरावरील २५०-३०० लिटर पाणी द्यावे. वरील चरणे करण्यापूर्वी जमिनीला मदत करण्यासाठी चकत्ता आणि खोलापात्रे वापरावे. \nबियाणे वितरण: बियाणे वितरणासाठी ५०-६० किलोग्राम्स प्रति एकर वापरावे. \nबियाणे जमिनीवर अनुकंपा करून वितरावे. बियाणे वितरताना सावधानीपूर्वक नियमित अंतरावर टाकावे. \nउगवणी: बियाणे वितरल्यानंतर प्राथमिक पाणीकाढणी करावी. \nउगवणीसाठी जमिनीवर ४-६ सेमीची तळबळी करावी. बागायतील अंतरावर १५०-२०० किलोग्राम यूरिया द्यावे. \nयूरिया देण्यापूर्वी प्राथमिक उपयोगासाठी १०० किलोग्राम दाटणे वापरावे. \nदेखभाल: वरील चरणे करण्यापूर्वी आपल्या विविध उपकरणांची मांडणी करावी. \nपाने दिसताना आपल्या प्रश्नांसाठी व्हेटील बुटांची नियमित तपास करावी. \nआरोग्यासाठी आवडता रोगनाशक वापरावा. \nपाणी प्रबंधन: उगवणीच्या वेळेत जमिनीला पर्यायी पाणी द्यावे. पाणीच्या प्रमाणांची नियमित तपास करावी. \nजमिनीच्या उपयोगासाठी प्रत्येक २५-३० एकरावरील २५०-३०० लिटर पाणी द्यावे. \nपानांची कापणी: या शृंगावर ध्यान द्या की पाने पुर्णतः बांधल्या जाऊ नये. खरोखरची पाने कापल्यास गोड उत्पादन मिळवता येईल. \nपक्षांची नियंत्रण: फसली शेतीत किंवा खेतीतील पक्षांची नियंत्रण करण्यासाठी प्राणीकीटनाशक वापरावे. \nपाण्याची प्रगासपटी: शेतकऱ्यांनी प्रत्येक वर्षी पाण्याची प्रगासपटी बनवावी. पानाची गवत: शेतकऱ्यांनी प्रत्येक वर्षी पानांची गवत करावी.',
                    cropGrowth: 'Checking ON TAP',
                    cropUrl: 'google.com',
                  ),
                ),
              );
            }, iconColor: Colors.white,
          ),
        ],
      ),
      )
    );
  }
}

class CropOption extends StatelessWidget {
  final String title;
  final ImageProvider image;
  final VoidCallback onTap;
  // final IconData icon;
  // final Color color;
   final Color iconColor;
  final String cropUrl; // New string for the website link

  const CropOption({
    required this.title,
    required this.image,
    required this.onTap,
    // required this.icon,
    // required this.color,
     required this.iconColor,
    this.cropUrl = '', // Provide default value for cropUrl

  });



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2.0,
              blurRadius: 6.0,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Image(
                  image: image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.5),
                  ],
                ),
              ),
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
