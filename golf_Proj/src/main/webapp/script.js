function fn_submit() {
    var fn = document.frm;

    if (fn.regist_month.value === "") {
        alert("수강월을 입력해주세요!");
        fn.regist_month.focus();
        return false;
    }
    if (fn.c_no.value === "") {
        alert("회원명을 선택해주세요!");
        fn.c_name.focus();
        return false;
    }
    if (fn.class_area.value === "") {
        alert("강의장소를 선택해주세요!");
        fn.class_area.focus();
        return false;
    }
    if (fn.tuition.value === "") {
        alert("강의명을 선택해주세요!");
        fn.teacher_code.focus();
        return false;
    }

    fn.submit();
}

function fn_reset() {
    if (confirm("정보를 지우고 처음부터 다시 입력합니다!")) {
        document.frm.reset();
        document.frm.c_no.value = "";
        document.frm.tuition.value = "";
        document.frm.regist_month.focus();
    }
}

function fn_change1() {
    var fn = document.frm;
    fn.tuition.value = "";
    fn.teacher_code.selectedIndex = 0;
    fn.c_no.value = fn.c_name.value;
}

function fn_change2() {
    var fn = document.frm;
    var price = Number(fn.teacher_code.value) * 1000;
    var cNo = Number(fn.c_no.value);

    if (!fn.teacher_code.value) {
        fn.tuition.value = "";
        return;
    }
    if (cNo >= 20000) {
        price *= 0.5;
    }
    fn.tuition.value = price;
}
