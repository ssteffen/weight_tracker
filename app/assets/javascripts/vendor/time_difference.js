// Simple function to calculate time difference between 2 Javascript date objects
function get_time_difference(earlierDate,laterDate)
{
       var nTotalDiff = laterDate.getTime() - earlierDate.getTime();
       var oDiff = new Object();

       oDiff.days = Math.floor(nTotalDiff/1000/60/60/24);
       nTotalDiff -= oDiff.days*1000*60*60*24;

       oDiff.hours = Math.floor(nTotalDiff/1000/60/60);
       nTotalDiff -= oDiff.hours*1000*60*60;

       oDiff.minutes = Math.floor(nTotalDiff/1000/60);
       nTotalDiff -= oDiff.minutes*1000*60;

       oDiff.seconds = Math.floor(nTotalDiff/1000);

       return oDiff;

}

//Modification by ssteffen
function formatted_get_time_difference(earlierDate, laterDate){
  var hash = get_time_difference(earlierDate, laterDate);
  var stringArray = []
  if(hash.days > 0)
    stringArray.push(hash.days + " days")
  if(hash.hours > 0)
    stringArray.push(hash.hours + " hours")
  if(hash.minutes > 0)
    stringArray.push(hash.minutes + " minutes")
  if(hash.seconds > 0)
    stringArray.push(hash.seconds + " seconds")
  if(stringArray.length < 1)
    return {str: "0 seconds ago", day: 0}
  return {str: stringArray.join(', ') + " ago", day: hash.days};
}

