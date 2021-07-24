//インストールしたファイルたちを呼び出します。
import { Calendar, computeShrinkWidth } from '@fullcalendar/core';
import interactionPlugin,{ Draggable } from '@fullcalendar/interaction';
import monthGridPlugin　from '@fullcalendar/daygrid'
import timeGridPlugin from '@fullcalendar/timegrid';
import { getJSON } from 'jquery';

var task = $('#mydraggable').data('t-id')
var taskName = task.Name
var taskTime = task.assumptionCost

 // カテゴリーセレクトボックスのオプションを作成
function appendOption(category) {
    var html = `<option value=${category.id}>${category.name}</option>`
    return html
}
 // 子カテゴリーの表示作成
function appendChidrenBox(insertHTML) {
    //子セレクトボックスのhtmlの生成
    var childSelectHtml = `<select class="listing-select-wrapper__box--select" id="child_category" name="category_id">
        <option value="---">---</option>
        ${insertHTML}
        </select>`
    //子セレクトボックスに追加
    $('.listing-product-detail__category').append(childSelectHtml);
}
 // 孫カテゴリーの表示作成
function appendGrandChidrenBox(insertHTML) {
    var grandchildSelectHtml = '';
    //孫セレクトボックスのhtmlの生成
    var grandChildSelectHtml = `<select class="listing-select-wrapper__box--select" id="grand_child_category" name="grand_category_id">
        <option value="---">---</option>
        ${insertHTML}
        </select>`
    //孫セレクトボックスに追加
    $('.listing-product-detail__category').append(grandChildSelectHtml);
}

 //子セレクトボックス以下を削除
function removeChildrenBox() {
    $('#child_category').remove();
}
//孫セレクトボックスの削除
function removeGrandChildBox() {
    $('#grand_child_category').remove();
}
//子セレクトボックスを生成するメソッド
function replaceChildrenOptions() {
    //子カテゴリーのPath取得
    var childrenPath = $(this).find('option:selected').data().childrenPath
    alert(childrenPath)
    //子カテゴリーのセレクトボックスを取得
    var selectChildren = $('form').find('.select-children')
    

    //子要素のパスが有る場合
    if (childrenPath) {

        //ajax設定
        $.ajax({
            url: childrenPath,
            dataType: 'json'
        })
            //サーバーから値を受け取った時
            .done(function (data) {
                //サーバーから受け取った子カテゴリーでセレクトボックスを置き換える
                replaceSelectOptions(selectChildren, data);
                appendChidrenBox(insertHTML);
            })
            //サーバーからの受け取りに失敗した時
            .fail(function (data) {
            // 受け取り失敗の場合の処理
            });
    }
    //子要素のパスが無い場合
    else {
        replaceSelectOptions(selectChildren, [])
    }
}
//子セレクトボックスのoptionタグを置換するメソッド
function replaceSelectOptions(selectChildren, data) {
    selectChildren.html('<option>')
    Object.keys(data).forEach(function(key) {
        console.log(data[key])
        //セレクトボックスにオプションを追加
        selectChildren.append($('<option>').html(data[key].name).val(key).data('children-path',));
    })
}

//親セレクトボックス選択後のイベント
$('#parent_category').on('change', function () {
    //選択された親カテゴリーの名前を取得
    var parentCategory = document.getElementById('parent_category').value
    if (parentCategory != "---") { //親カテゴリーが初期値でない場合
        $.ajax({
            url: gon.get_category_children,
            type: 'GET',
            data: { parent_id: parentCategory },
            dataType: 'json'
        })
        .done(function(children) {
            //子セレクトボックスを削除
            removeChildrenBox();
            //挿入するHTMLを初期化
            var insertHTML = '';
            //子セレクトボックスのoptionタグの生成
            children.forEach(function (child) {
                insertHTML += appendOption(child);
            });
            //セレクトボックスに追加
            appendChidrenBox(insertHTML);
        })
        .fail(function () {
            alert('カテゴリー取得に失敗しました')
        })
    } else { //親カテゴリーが初期値の場合、
        //子セレクトボックスを削除
        removeChildrenBox();
    }

})
//子セレクトボックス選択後のイベント
$('.listing-product-detail__category').on('change','#child_category',function () {
    //選択された子カテゴリーのIDを取得
    var childId = $('#child_category option:selected').val();
    //子カテゴリーが初期値でない場合
    if (childId != "---") {
        //サーバーから孫要素を取得
        $.ajax({
            url: gon.get_grand_category_children,
            type: 'GET',
            data: { child_id: childId },
            dataType:'json'
        })
        .done(function (grandChildren) {
            //孫セレクトボックスの削除
            removeGrandChildBox()
            var insertHTML = '';
            //孫要素のoptionタグを生成
            grandChildren.forEach(function(grandChild){
                insertHTML += appendOption(grandChild);
            })
            //孫要素のselectBoxを追加
            appendGrandChidrenBox(insertHTML)
        })
        .fail(function(){
            alert('孫カテゴリー取得用のajaxリクエスト失敗')
        })
    }
    //子カテゴリーが初期値の場合
    else {
        //孫セレクトボックスの削除
        removeGrandChildBox()
    }
    

    
    
})


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