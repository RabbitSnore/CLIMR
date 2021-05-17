Qualtrics.SurveyEngine.addOnload(function () {
    /*Place your JavaScript here to run when the page loads*/

});

Qualtrics.SurveyEngine.addOnReady(function () {


    const monthNames = ["January", "February", "March", "April", "May", "June",
        "July", "August", "September", "October", "November", "December"];


    function weekend_a_year_from_now() {
        let today = new Date();
        let dayOfWeek = 6;//Sat
        let date = new Date(today.setFullYear(today.getFullYear() + 1));
        let diff = date.getDay() - dayOfWeek;
        if (diff > 0) {

            date.setDate(date.getDate() + 6);
        } else if (diff < 0) {
            date.setDate(date.getDate() + ((-1) * diff))
        }
        let nextday = new Date();
        nextday.setDate(date.getDate() + 1);
        let weekend = monthNames[date.getMonth()] + ' ' + date.getDate() + '-' + nextday.getDate() + ', ' + date.getFullYear()

        return (weekend);


    }

    function ten_months() {
        let yeartext;
        let today = new Date();
        let thisYear = today.getFullYear();
        let date = new Date(today.setMonth(today.getMonth() + 10));
        let thatyear = date.getFullYear();
        if (thisYear === thatyear) {
            yeartext = 'this'
        } else {
            yeartext = 'next'
        }
        console.log(monthNames[date.getMonth()], yeartext, 'year')
        let displayDate = monthNames[date.getMonth()] + ' ' + yeartext + ' year'
        return displayDate
    }

    function month_year(months) {
        let today = new Date();
        let date = new Date(today.setMonth(today.getMonth() + months));
        let thatyear = date.getFullYear();
        let displayDate = monthNames[date.getMonth()] + ' ' + thatyear
    };

    Qualtrics.SurveyEngine.setEmbeddedData('12_months_from_survey', weekend_a_year_from_now());
    Qualtrics.SurveyEngine.setEmbeddedData('10_months_from_survey', ten_months());
    Qualtrics.SurveyEngine.setEmbeddedData('8_months_from_survey', month_year(8));
    Qualtrics.SurveyEngine.setEmbeddedData('7_months_from_survey', month_year(7));

});

Qualtrics.SurveyEngine.addOnUnload(function () {
    /*Place your JavaScript here to run when the page is unloaded*/

});