Qualtrics.SurveyEngine.addOnload(function()
{
	/*Place your JavaScript here to run when the page loads*/

});


Qualtrics.SurveyEngine.addOnReady(function () {
    let quest = this;
    let boxes = quest.questionContainer.querySelectorAll(".AnswerContainer"),
        add_button = quest.questionContainer.querySelector("#addbutton"),
        remove_button = quest.questionContainer.querySelector("#removebutton"),
        tracker = 1,
        all_choices = quest.getChoices();


    quest.disableNextButton();
    boxes.forEach((box) => box.hide());
    boxes.forEach((box) => jQuery(box).css("width", "120px"));

    boxes[tracker - 1].show();

    quest.questionclick = function (event, element) {
        if (quest.getSelectedChoices().length === all_choices.length) {
            quest.enableNextButton();
        } else {
            quest.disableNextButton();
        }

    };

    add_button.onclick = function () {
        if (tracker < boxes.length) {
            tracker++;
            boxes[tracker - 1].show();
        } else {
            alert("Max Boxes");
        }
    };
    jQuery(".Choices").css("width", "720px");
    jQuery(".Answers").css("width", "720px");

    remove_button.onclick = function () {
        if (tracker <= 1) {
            alert("Min boxes");
            return false;
        }
        let clear_choices = [];
        all_choices.forEach((item) => {
            if (quest.getChoiceAnswerValue(item) == tracker) clear_choices.push(item);
        });
        clear_choices.forEach((ch) => {
            quest.setChoiceAnswerValue(ch, tracker, 0);
        });
        tracker--;
        boxes[tracker].hide();
    };
    jQuery(".Answers").prepend('<div style="text-align: center; position: static;"><button id="addbutton" class="climr-boxer" style="font-size : 13px; width: 17%; height: 30px;"><strong> Add Group</strong></button><button id="removebutton" class="climr-boxer" style="font-size : 13px; width: 17%; height: 30px;"><strong>Remove Group</strong></button></div>')

});


Qualtrics.SurveyEngine.addOnUnload(function () {
    /*Place your JavaScript here to run when the page is unloaded*/

});