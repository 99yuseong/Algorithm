# [level 1] 신고 결과 받기 - 92334 

[문제 링크](https://school.programmers.co.kr/learn/courses/30/lessons/92334) 

### 성능 요약

메모리: 38.1 MB, 시간: 830.54 ms

### 구분

코딩테스트 연습 > 2022 KAKAO BLIND RECRUITMENT

### 채점결과

정확성: 100.0<br/>합계: 100.0 / 100.0

### 제출 일자

2025년 03월 18일 14:17:57

### 문제 설명

<h5>문제 설명</h5>

<p>신입사원 무지는 게시판 불량 이용자를 신고하고 처리 결과를 메일로 발송하는 시스템을 개발하려 합니다. 무지가 개발하려는 시스템은 다음과 같습니다.</p>

<ul>
<li>각 유저는 한 번에 한 명의 유저를 신고할 수 있습니다.

<ul>
<li>신고 횟수에 제한은 없습니다. 서로 다른 유저를 계속해서 신고할 수 있습니다.</li>
<li>한 유저를 여러 번 신고할 수도 있지만, 동일한 유저에 대한 신고 횟수는 1회로 처리됩니다.</li>
</ul></li>
<li>k번 이상 신고된 유저는 게시판 이용이 정지되며, 해당 유저를 신고한 모든 유저에게 정지 사실을 메일로 발송합니다.

<ul>
<li>유저가 신고한 모든 내용을 취합하여 마지막에 한꺼번에 게시판 이용 정지를 시키면서 정지 메일을 발송합니다.</li>
</ul></li>
</ul>

<p class="">다음은 전체 유저 목록이 ["muzi", "frodo", "apeach", "neo"]이고, k = 2(즉, 2번 이상 신고당하면 이용 정지)인 경우의 예시입니다.</p>
<table class="table">
        <thead><tr>
<th>유저 ID</th>
<th>유저가 신고한 ID</th>
<th>설명</th>
</tr>
</thead>
        <tbody><tr>
<td class="">"muzi"</td>
<td class="">"frodo"</td>
<td class="">"muzi"가 "frodo"를 신고했습니다.</td>
</tr>
<tr>
<td class="">"apeach"</td>
<td class="">"frodo"</td>
<td class="">"apeach"가 "frodo"를 신고했습니다.</td>
</tr>
<tr>
<td class="">"frodo"</td>
<td class="">"neo"</td>
<td class="">"frodo"가 "neo"를 신고했습니다.</td>
</tr>
<tr>
<td class="">"muzi"</td>
<td class="">"neo"</td>
<td class="">"muzi"가 "neo"를 신고했습니다.</td>
</tr>
<tr>
<td class="">"apeach"</td>
<td class="">"muzi"</td>
<td class="">"apeach"가 "muzi"를 신고했습니다.</td>
</tr>
</tbody>
      </table>
<p>각 유저별로 신고당한 횟수는 다음과 같습니다.</p>
<table class="table">
        <thead><tr>
<th>유저 ID</th>
<th>신고당한 횟수</th>
</tr>
</thead>
        <tbody><tr>
<td class="">"muzi"</td>
<td>1</td>
</tr>
<tr>
<td class="">"frodo"</td>
<td>2</td>
</tr>
<tr>
<td class="">"apeach"</td>
<td>0</td>
</tr>
<tr>
<td class="">"neo"</td>
<td>2</td>
</tr>
</tbody>
      </table>
<p>위 예시에서는 2번 이상 신고당한 "frodo"와 "neo"의 게시판 이용이 정지됩니다. 이때, 각 유저별로 신고한 아이디와 정지된 아이디를 정리하면 다음과 같습니다.</p>
<table class="table xt-translated">
        <thead><tr>
<th>유저 ID</th>
<th>유저가 신고한 ID</th>
<th>정지된 ID</th>
</tr>
</thead>
        <tbody><tr>
<td>"muzi"</td>
<td>["frodo", "neo"]</td>
<td>["frodo", "neo"]</td>
</tr>
<tr>
<td>"frodo"</td>
<td>["neo"]</td>
<td>["neo"]</td>
</tr>
<tr>
<td>"apeach"</td>
<td>["muzi", "frodo"]</td>
<td>["frodo"]</td>
</tr>
<tr>
<td>"neo"</td>
<td>없음</td>
<td>없음</td>
</tr>
</tbody>
      <xt-dual class="xt-dual block" xt-origin="유저 ID	유저가 신고한 ID	정지된 ID
&quot;muzi&quot;	[&quot;frodo&quot;, &quot;neo&quot;]	[&quot;frodo&quot;, &quot;neo&quot;]
&quot;frodo&quot;	[&quot;neo&quot;]	[&quot;neo&quot;]
&quot;apeach&quot;	[&quot;muzi&quot;, &quot;frodo&quot;]	[&quot;frodo&quot;]
&quot;neo&quot;	없음	없음" style="opacity: 0.8; font-size: 16px;" xt-translation="유저 ID 유저가 신고한 ID 정지된 ID
&quot;muzi&quot; [&quot;프로도&quot;, &quot;네오&quot;] [&quot;프로도&quot;, &quot;네오&quot;]
&quot;frodo&quot; [&quot;네오&quot;] [&quot;네오&quot;]
&quot;apeach&quot; [&quot;muzi&quot;, &quot;frodo&quot;] [&quot;프로도&quot;]
&quot;neo&quot; 없음 없음"><xt-br></xt-br><xt-content style="opacity: 0.8;">유저 ID 유저가 신고한 ID 정지된 ID
"muzi" ["프로도", "네오"] ["프로도", "네오"]
"frodo" ["네오"] ["네오"]
"apeach" ["muzi", "frodo"] ["프로도"]
"neo" 없음 없음</xt-content></xt-dual></table>
<p>따라서 "muzi"는 처리 결과 메일을 2회, "frodo"와 "apeach"는 각각 처리 결과 메일을 1회 받게 됩니다.</p>

<p>이용자의 ID가 담긴 문자열 배열 <code>id_list</code>, 각 이용자가 신고한 이용자의 ID 정보가 담긴 문자열 배열 <code>report</code>, 정지 기준이 되는 신고 횟수 <code>k</code>가 매개변수로 주어질 때, 각 유저별로 처리 결과 메일을 받은 횟수를 배열에 담아 return 하도록 solution 함수를 완성해주세요.</p>

<hr>

<h5>제한사항</h5>

<ul>
<li>2 ≤ <code>id_list</code>의 길이 ≤ 1,000

<ul>
<li>1 ≤ <code>id_list</code>의 원소 길이 ≤ 10</li>
<li><code>id_list</code>의 원소는 이용자의 id를 나타내는 문자열이며 알파벳 소문자로만 이루어져 있습니다.</li>
<li><code>id_list</code>에는 같은 아이디가 중복해서 들어있지 않습니다.</li>
</ul></li>
<li>1 ≤ <code>report</code>의 길이 ≤ 200,000

<ul>
<li>3 ≤ <code>report</code>의 원소 길이 ≤ 21</li>
<li><code>report</code>의 원소는 "이용자id 신고한id"형태의 문자열입니다.</li>
<li class="">예를 들어 "muzi frodo"의 경우 "muzi"가 "frodo"를 신고했다는 의미입니다.</li>
<li>id는 알파벳 소문자로만 이루어져 있습니다.</li>
<li>이용자id와 신고한id는 공백(스페이스)하나로 구분되어 있습니다.</li>
<li>자기 자신을 신고하는 경우는 없습니다.</li>
</ul></li>
<li>1 ≤ <code>k</code> ≤ 200, <code>k</code>는 자연수입니다.</li>
<li>return 하는 배열은 <code>id_list</code>에 담긴 id 순서대로 각 유저가 받은 결과 메일 수를 담으면 됩니다.</li>
</ul>

<hr>

<h5>입출력 예</h5>
<table class="table xt-translated">
        <thead><tr>
<th>id_list</th>
<th>report</th>
<th>k</th>
<th>result</th>
</tr>
</thead>
        <tbody><tr>
<td class=""><code>["muzi", "frodo", "apeach", "neo"]</code></td>
<td class=""><code>["muzi frodo","apeach frodo","frodo neo","muzi neo","apeach muzi"]</code></td>
<td>2</td>
<td class="">[2,1,1,0]</td>
</tr>
<tr>
<td class=""><code>["con", "ryan"]</code></td>
<td class=""><code>["ryan con", "ryan con", "ryan con", "ryan con"]</code></td>
<td>3</td>
<td class="">[0,0]</td>
</tr>
</tbody>
      <xt-dual class="xt-dual block" xt-origin="id_list	report	k	result
[&quot;muzi&quot;, &quot;frodo&quot;, &quot;apeach&quot;, &quot;neo&quot;]	[&quot;muzi frodo&quot;,&quot;apeach frodo&quot;,&quot;frodo neo&quot;,&quot;muzi neo&quot;,&quot;apeach muzi&quot;]	2	[2,1,1,0]
[&quot;con&quot;, &quot;ryan&quot;]	[&quot;ryan con&quot;, &quot;ryan con&quot;, &quot;ryan con&quot;, &quot;ryan con&quot;]	3	[0,0]" style="opacity: 0.8; font-size: 16px;" xt-translation="id_list k 결과 보고
[&quot;muzi&quot;, &quot;frodo&quot;, &quot;apeach&quot;, &quot;neo&quot;]	[&quot;muzi frodo&quot;,&quot;apeach frodo&quot;,&quot;frodo neo&quot;,&quot;muzi neo&quot;,&quot;apeach muzi&quot;] 2 [2,1,1,0]
[&quot;사기꾼&quot;, &quot;라이언&quot;]	[&quot;라이언 콘&quot;, &quot;라이언 콘&quot;, &quot;라이언 콘&quot;] 3 [0,0]"><xt-br></xt-br><xt-content style="opacity: 0.8;">id_list k 결과 보고
["muzi", "frodo", "apeach", "neo"]	["muzi frodo","apeach frodo","frodo neo","muzi neo","apeach muzi"] 2 [2,1,1,0]
["사기꾼", "라이언"]	["라이언 콘", "라이언 콘", "라이언 콘"] 3 [0,0]</xt-content></xt-dual></table>
<hr>

<h5>입출력 예 설명</h5>

<p><strong>입출력 예 #1</strong></p>

<p>문제의 예시와 같습니다.</p>

<p><strong>입출력 예 #2</strong></p>

<p>"ryan"이 "con"을 4번 신고했으나, 주어진 조건에 따라 한 유저가 같은 유저를 여러 번 신고한 경우는 신고 횟수 1회로 처리합니다. 따라서 "con"은 1회 신고당했습니다. 3번 이상 신고당한 이용자는 없으며, "con"과 "ryan"은 결과 메일을 받지 않습니다. 따라서 [0, 0]을 return 합니다.</p>

<hr>

<h5>제한시간 안내</h5>

<ul>
<li>정확성 테스트 : 10초</li>
</ul>


> 출처: 프로그래머스 코딩 테스트 연습, https://school.programmers.co.kr/learn/challenges