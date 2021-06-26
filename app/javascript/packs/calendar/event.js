//インストールしたファイルたちを呼び出します。
import { Calendar } from '@fullcalendar/core';
import interactionPlugin,{ Draggable } from '@fullcalendar/interaction';
import monthGridPlugin　from '@fullcalendar/daygrid'
import timeGridPlugin from '@fullcalendar/timegrid';

var task = $('#mydraggable').data('t-id')
var taskName = task.Name
var taskTime = task.assumptionCost

document.addEventListener('DOMContentLoaded', function () {
    var draggableEl = document.getElementById('mydraggable'); //ドラッグ&ドロップ用の要素
    var calendarEl = document.getElementById('calendar');　//カレンダー用の要素
    
    //カレンダーの中身を設定(月表示とか、クリックアクション起こしたいとか、googleCalendar使うととか)
    var calendar = new Calendar(calendarEl, {
        plugins: [monthGridPlugin, timeGridPlugin, interactionPlugin],
        droppable: true,
         events: [
            // events here
        ],
        editable: true,
        initialView: 'timeGridWeek',
        //細かな表示設定
        locale: 'ja',
        timeZone: 'Asia/Tokyo',
        firstDay: 1,
        headerToolbar: {
            start: '',
            center: 'title',
            end: 'today prev,next'
        },
        expandRows: true,
        stickyHeaderDates: true,
        buttonText: {
            today: '今日'
        },
        allDayText: '終日',
        height: "auto",

        dateClick: function (info) {
            //日付をクリックしたときのイベント(詳しくは次回の記事へ)
        },
        eventClick: function (info) {
            //表示されたイベントをクリックしたときのイベント(詳しくは次回の記事へ)
        },
        eventClassNames: function (arg) {
            //表示されたイベントにclassをcss用に追加する(詳しくは次回の記事へ)
        },
        eventDrop: function() {
            //ドラッグ完了時の処理****
                console.log('date')
            //draggableEl.style.display = "none";
        },
        drop: function(allDay) {
            //ドラッグ完了時の処理****
            if (allDay) {
                alert('test')
                draggableEl.style.display = "none"
            }
            //draggableEl.style.display = "none";
        }
    });
    //カレンダー外のドラッグ&ドロップ要素の設定
    new Draggable(draggableEl, {
        eventData: {
            title: taskName,
            duration: taskTime,
        },
    });

    //カレンダー表示    
    calendar.render();
});