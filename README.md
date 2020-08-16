# README

## My Post it
<img width="1325" alt="スクリーンショット 2020-08-16 10 13 45" src="https://user-images.githubusercontent.com/62829792/90324506-a3935e80-dfaa-11ea-9918-d1ac176c39e5.png">
This tool enable you to manage your tasks like "kanban method".<br>
You can check and change situation of your tasks wherever you are if only you access this "My Post it"!
このアプリは「カンバン方式」でタスクを管理できるツールです。<br>
このアプリにアクセスするだけで、手元に「カンバン」を作成することができ、タスクの状況を確認することができます。<br>

## Description
This tool is based on "Trello".<br>
This tool is simpler than it but if you want to manage only your task's contents and situations, this tool will help you manage tasks easier.<br>
You can manage your multiple tasks per project. <br>
You can check tasks written on some sticy notes called "post-it".<br>
When you want to add a new task, you only create new "post-it" on the board applying the task's situation.<br>
このアプリは「Trello」を元にして作成いたしました。<br>
Trelloはタスクの振り分けや詳細を記入しておく機能などたくさんの便利な機能がありますが、「MyPostit」はもっとシンプルな仕様です。<br>
特に高度な機能が要らないということであれば、このアプリを使っていただければ、タスクの名前と内容、そしてタスクの状況をまるで付箋に書いてホワイトボードに貼っていくかのようにシンプルに管理することができます。<br>
新たにタスクを作りたい場合はプロジェクトごとに新たなタスクを作成することができます。タスクを作成する際は、現在のタスクの状況に応じたボードの上に作成してください。

## Usage
$ git clone https://github.com/atsukofu/my-post-it.git<br>
$ cd hoge<br>
$ bundle install<br>
$ rails db:create<br>
$ rails db:migrate<br>
$ rails s<br>
👉 http://localhost:3000
上記コマンドでダウンロードし、ローカルサーバーで起動してください。

If you access on internet Web site, please access later URL.<br>
You can use this tool when you create an account.(Please sign up.)<br>
Web上でアクセスされる場合は下記URLにアクセスしてください。<br>
アカウントを作成していただくと、アプリを使うことができます。<br>
👉 https://my-post-it.herokuapp.com/

## Commitment
It has a simple UI　and you can use it by easier oparation.<br>
When you want to change a situation of task, you only move "post-it" to another board by drag and drop and the situation  of task is updated.<br>
Also, because I'd like to understand how session works, I made the feature of making account and doing Login/Logout unless using gem "devise".<br> 
このアプリのこだわりの点は、シンプルな見た目と配色、また操作方法もシンプルに簡単にしたことです。<br>
作成したタスクの状況が変わった時(例えばTodoからDoingに変わった時）は、タスクのpostit（付箋）をドラッグアンドドロップすれば、タスクの状況を変更することができます。<br>
また、タスクをボードからボードへ移動させるとajax通信でtasksテーブルのsituationカラムの内容を更新することができます。
また、今回のアプリ制作においてセッションの仕組みを理解するため、<br>
ユーザー登録によく使用されるgem 「devise」を使用せずに、ユーザー登録機能とログイン・ログアウト機能を実装したことも、このアプリ作成におけるこだわった点です。<br>
また、テストコード （モデル単体テスト　rspecを使用）を記述したこともこだわりポイントです。

## Technology Used
- Ruby On Rails
- Ruby
- HTML
- Sass
- jQuery UI
- MySQL
ドラッグアンドドロップ については
jQueryUIを使用して実装いたしました。

## Future Plans
I want to add the function of deleting by drag and drop, editing user account and project information, making group.
今後さらにアプリを改善するのであれあば、ドラッグアンドドロップを使ってタスクを削除する機能、<br>
ユーザー情報の編集機能、プロジェクトの編集機能、グループ作成機能を搭載すると、もっと便利に使えるのではないかと考えています。<br>

## DB design
### users table
|Column|Type|Options|
|------|----|-------|
|username|string|null: false|
|email|string|null: false, unique: true|
|password_digest|string|null: false|

### Association
- has many projects

### projects table
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|user_id|integer|null: false, foreign_ley: true|

### Association
- belongs_to user
- has_many tasks

### tasks table
|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|content|text||
|status|integer|null: false|
|project_id|integer|null: false, foreign_ley: true|

### Association
- belongs_to project
