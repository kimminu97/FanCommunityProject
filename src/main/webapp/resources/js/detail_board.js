function update(){
    document.getElementById('cont').innerHTML=`
    <form>
                <input type="hidden" name="idx" value="{bean.idx}">
                <input type="hidden" name="pageNo" value="{page}">
                <textarea  rows="20" name="content" class="input1" 
                style="border:1px solid gray;width:90%" required="required">{bean.content}</textarea>
    </form>
    `;

    document.getElementById('func').innerHTML=`
        <a class="button" onclick="javascript:save()">저장</a>
        <a class="button" onclick="javascript:reset()">취소</a>
    `;
}
function reset(){
    document.getElementById('cont').innerHTML=`
        <pre>{bean.content }</pre>
    `;

    document.getElementById('func').innerHTML=`
        <a class="button" onclick="javascript:update()">수정</a>
        <a class="button" onclick="javascript:deleteOk();">삭제</a>
    `;

}

function save(){
    document.forms[0].action='update';
    document.onsubmit();
}
