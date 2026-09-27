# 📊 لوحة تحكم تحليل المبيعات وسيناريوهات المستقبل | Power BI Sales Dashboard

## 📌 نبذة عن المشروع (Project Overview)
يهدف هذا المشروع إلى بناء لوحة تحكم تفاعلية (Interactive Dashboard) باستخدام برنامج **Power BI** لتحليل بيانات المبيعات المستخرجة من **SQL Server**. تتيح اللوحة للإدارة فهم اتجاهات الأداء المالي، تحديد المنتجات والفئات الأكثر مبيعاً، واستكشاف أثر التغيرات المستقبلية في المبيعات على الأرباح باستخدام تقنيات محاكاة سيناريو "ماذا لو" (What-If Analysis).

---

## 🛠️ أدوات وتقنيات العمل (Tech Stack)
* **Power BI Desktop:** لبناء النموذج، كتابة معادلات DAX، وتصميم الواجهات المرئية.
* **SQL Server:** المصدر الرئيسي لقواعد البيانات والجداول المستخدمة.
* **Power Query Editor:** لتنظيف وتحويل البيانات (Data Transformation) وإضافة الأعمدة المخصصة.
* **DAX (Data Analysis Expressions):** لكتابة المقاييس الحسابية (Measures) والمتغيرات التفاعلية.

---

## 📂 خطوات بناء المشروع (Implementation Steps)

### 1. ربط واستيراد البيانات (Data Connection & Import)
* تم ربط Power BI بـ **SQL Server** باستخدام وضع **Import Mode**.
* تحديد واستيراد الجداول الرئيسية الخاصة بالمبيعات والمنتجات والتواريخ (`Sales`, `Products`, `Categories`).

### 2. تجهيز وتحويل البيانات (Power Query Transformation)
* مراجعة أنواع البيانات (Data Types) والتحقق من جودتها.
* إضافة أعمدة مخصصة (Custom Columns) وشروط (Conditional Columns) داخل محرر **Power Query** لدعم التحليلات المطلوبة.

### 3. كتابة معادلات DAX والمقاييس (DAX Measures)
تم حساب المقاييس الرئيسية للتحليل:

* **إجمالي المبيعات (Total Sales):**

  Total Sales = SUM('Sales'[TotalAmount])

### 4. Different Visulazation:
1- Chart for categories & year by total amount
2- Chart for compare profit with total amount
3- sclier to calculate profit by change amount 
4- Text Box for comments  

### 5. Using Drill Up & Drill down with default hierarchy also create hierarchy