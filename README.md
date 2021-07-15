# google_sheets_api

Screenshots:

![Screenshot_20210715_185207](https://user-images.githubusercontent.com/70195348/125796504-a9e32321-8d19-4707-a764-4ea6cf9be8c7.jpg)

![Screenshot_20210715_185223](https://user-images.githubusercontent.com/70195348/125796511-8b940a67-2a19-4131-98b1-5d4535dcd0bf.jpg)


## Getting Started
This app fetches the data from Google sheets using sheets API from json files and displays it in your app screen. Ihaev added basic question answers in the sheets you can create your own sheets and get that data into your app just by following simple steps.

Create your google docs and use the given format for creating JSON code using google script editor 
Then follow the method given in sheets_api.dart file for getting json data and convert it to dart code.

<!-- function doGet() {
  var sheet=SpreadsheetApp.openById("1YuWmk4kTZXRnJYsA9pqjeUMTY0b-0K_mYnwbKKaDCMo");
  var values=sheet.getActiveSheet().getDataRange().getValues();
  var data=[];

  for(var i=1;i<values.length;i++){
    var row=values[i];
    var faqs={};

    faqs['questions']=row[0];
    faqs['faq_answers']=row[1];
    data.push(faqs);
  }

  return ContentService.createTextOutput(JSON.stringify(data)).setMimeType(ContentService.MimeType.JSON);
}

 -->
