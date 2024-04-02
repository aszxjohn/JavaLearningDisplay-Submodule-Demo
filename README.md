# JavaLearningDisplay
Java Learning Display

專案介紹
自主練習展示
此專案目標是將自己有興趣的東西以模組化的方式撰寫出來。
並盡可能的去研究多人合作開發的話要怎麼讓工作更順利。
Version : 0.4.0
last updated date : 2024/03/12


主要目標:
1. 專案以multi-module的方式建置、Common與ORM要能被多個專案引用 (已完成)
2. 專案要能支援git submodule 功能 (已完成)
3. 追加前端頁面（pending)

功能列表:
1. 客戶帳號註冊系統、客戶帳號審核系統，專案名稱:RegAuthSystem  ( in progress 進度:審核系統)
2. JWT登入系統，且使用Redies紀錄Token(Pending)
3. 產品訂價管理系統(Pending)



專案環境建置文件放置於/document/環境建置SOP.docx


程式架構邏輯
各種Controller > Controller同名Service > Entity同名Service > Repository >Entity

專案引用邏輯
各種System > orm 與 common > util工具專案(示意此專案沒有)

好處是 orm 跟 common可以使用成為各種專案的基底，或同時支援多種專案，
甚至製作util工具專案成為公司的library被不同的專案使用，也可以支援Git Submodule來增加靈活性
Dto的部分是今天離開Service到Controller與 Controller要回傳的時候均使用Dto處理，Service內部以Optional<Entity>為主


未來待研究
1. Kubernetes 自動擴展
2. Doxygen 自動文件產生，用來快速生產系統文件讓維運更順暢



