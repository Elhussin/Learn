# ربط النطاق الفرعي eyetest.osmbeta.cloud بـ GitHub Pages

هذا الملف يلخص خطوات ربط النطاق الفرعي **`eyetest.osmbeta.cloud`** بصفحة GitHub Pages الخاصة بالمشروع: **`https://elhussin.github.io/eye-test/`** باستخدام مزود الدومين **Hostinger**.

---

## 1. إعداد الدومين في GitHub

هذه الخطوة تتم داخل مستودع GitHub الخاص بك (`eye-test`).

1.  **اذهب إلى المستودع:** افتح مستودع `eye-test`.
2.  **انتقل إلى الإعدادات:** Settings > Pages.
3.  **أدخل النطاق المخصص:** في حقل "Custom domain"، أدخل النطاق الفرعي بالكامل:
    ```
    eyetest.osmbeta.cloud
    ```
4.  **احفظ التغييرات:** اضغط على **Save**.
    * (ملاحظة: سيتم تلقائياً إنشاء ملف CNAME في جذر المستودع.)

---

## 2. إعداد سجل CNAME في Hostinger

لأننا نستخدم **نطاقاً فرعياً (Subdomain)**، نحتاج فقط إلى سجل **CNAME** في إعدادات DNS الخاصة بدومينك الرئيسي (`osmbeta.cloud`).

1.  **سجل الدخول إلى Hostinger** واذهب إلى **إدارة DNS** الخاصة بدومين **`osmbeta.cloud`**.
2.  **أضف سجل DNS جديد** بالبيانات التالية:

| الخاصية (Property) | القيمة (Value) |
| :---: | :---: |
| **النوع (Type)** | `CNAME` |
| **الاسم (Host/Name)** | `eyetest` |
| **يشير إلى (Points To / Target)** | `elhussin.github.io` |

---

## 3. التحقق والتأمين (HTTPS)

1.  **الانتظار:** انتظر من بضع دقائق إلى عدة ساعات حتى يتم تحديث سجل DNS عالمياً.
2.  **التحقق:** عد إلى إعدادات GitHub Pages، وتأكد من ظهور علامة **"DNS check successful"** بجوار نطاقك.
3.  **تفعيل HTTPS:** عند نجاح التحقق، قم بتحديد مربع **"Enforce HTTPS"** لتأمين موقعك.

بعد هذه الخطوات، سيصبح موقعك متاحاً عبر: **`https://eyetest.osmbeta.cloud`**.



