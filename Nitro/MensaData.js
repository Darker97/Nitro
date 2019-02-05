var testFunct = function(message) {     return "Hello";    };

//Scrapper für die Mensa Data

var baba = function scrapper2(message){
    
    
    result = message.evaluate(function() {
                              var data = [];
                              console.log("Test");
                              $('.cell1').each(function()
                                               {
                                               const title = $(this).find('.artikel').text();
                                               const text = $(this).find('.descr').text();
                                               
                                               data.push({
                                                         'title' : title,
                                                         'text'   : text
                                                         });
                                               });
                              return data;
                              });
    return result;
}
