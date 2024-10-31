//初期設定
q_sel = 3; //選択肢の数
q_max = 3; //出題数



setReady();

//初期設定
function setReady() {
count = 0; //問題番号
ansers = new Array(); //解答記録
seikai = 0; // ++++++

//問題と解答
qa = new Array();
qa[0] = ["print()の処理方法は？","()内の文字列を出力できる","()内の文字列を出力して、最後に改行が追加される","キーボードで打ち込んだ文字を取り出す",1];
qa[1] = ["getsの処理方法は？","キーボードで打ち込んだ文字を取り出す","コメント文にする","対応する値を整数の文字列に置き換える",1];
qa[2] = ["％d、％f、％sが使える出力形式は？","print","gets","printf",3];
qa[3] = ["対応する値を文字列に置き換えるのはどれ？","％d","％s","％f",2];
qa[4] = ["「#」を使った時はどのように処理が行われる？","改行される","掛け算される","コメントアウトされる",3];
qa[5] = ["プログラムの一部を実行させなかったり、同じ処理を何回も繰り返したりすることができるものは？","制御構造","破壊的操作","乱数",1];
qa[6] = ["redoの処理内容は？","処理を中止して、ループを終わらせる","条件を判断せず、処理を最初からやり直す","処理をスキップして、次のループに移る",2];
qa[7] = ["forの処理方法は？","配列や範囲などの複数の間を順に変数に代入する","配列の要素を小さい順に並べ替えた結果を返す","配列の末尾に要素を追加する",1];
qa[8] = ["変数とは何か？","値につける名前","複数の値をひとまとめにできるもの","数字の中からランダムに発生させる数",1];
qa[4] = ["Time.now を使うと何ができる？","一時停止できる","配列の要素を小さい順に並べ替えれる","現在の時刻を受け取ることができる",3];

//最初の問題
quiz();
}

//問題表示
function quiz() {
var s, n;
//問題
md = Math.floor(Math.random() * qa.length); //乱数
document.getElementById("text_q").innerHTML = (count + 1) + "問目：" + qa[md][0];
//選択肢
s = "";
for (n=1;n<=q_sel;n++) {
if (qa[md][n] != "") {
s += "【<a href='javascript:anser(" + n + ")'>" + n + "：" + qa[md][n] + "</a>】";
}
}
document.getElementById("text_s").innerHTML = s;
// qa.splice(md,1); // ------------------
}

//解答表示
function anser(num) {
var s;
s = (count + 1) + "問目：";
//答え合わせ
if (num == qa[md][q_sel + 1]) {
//正解
ansers[count] = "○";
seikai ++; // ++++++
} else {
ansers[count] = "×";
}
s += ansers[count] + qa[md][num];
document.getElementById("text_a").innerHTML = s;

qa.splice(md,1); console.log(qa); // ++++++++++
//次の問題を表示
count++;
if (count < q_max) {
quiz();
} else {
//終了
s = "<table border='2'><caption>成績発表</caption>";
//1行目
s += "<tr><th>問題</th>";
for (n=0;n<q_max;n++) {
s += "<th>" + (n+1) + "</th>";
}
s += "</tr>";
//2行目
s += "<tr><th>成績</th>";
for (n=0;n<q_max;n++) {
s += "<td>" + ansers[n] + "</td>";
}
s += "</tr>";
s += "</table>";
s += "<br>成績は、" + seikai + "点です"; // +++++++

document.getElementById("text_q").innerHTML = s;
//次の選択肢
s = "【<a href='javascript:history.back()'>前のページに戻る</a>】";
s += "【<a href='javascript:setReady()'>同じ問題を最初から</a>】";
s += "【<a href=''>次の問題に進む</a>】";
document.getElementById("text_s").innerHTML = s;
}
}