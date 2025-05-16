# شرح:
__init__: دالة البناء (المُنشئ) اللي تشتغل أول ما تنشئ object من الكلاس.

self.name و self.capacity: خصائص جديدة خاصة بالـ Boat.

move: تم تنفيذها حسب المطلوب من الكلاس الأب، لكن بشكل خاص لهذا الكائن.

# أهم مفاهيم OOP:
التغليف (Encapsulation): إخفاء التفاصيل الداخلية للكائن، وعدم السماح بالوصول المباشر للبيانات إلا من خلال وظائف خاصة.

الوراثة (Inheritance): كائن جديد يمكنه أن يرث خصائص ووظائف من كائن آخر.

تعدد الأشكال (Polymorphism): إمكانية استخدام نفس الوظيفة بأشكال مختلفة حسب السياق.

التجريد (Abstraction): إخفاء التفاصيل غير المهمة وإظهار فقط المهم للمستخدم.

# مثال واقعي:
لو بتعمل برنامج لإدارة سيارات:

تعمل Class باسم Car، وتخلي فيها خصائص زي اللون، السرعة، الموديل.

وتضيف لها وظائف زي drive() وstop().

كل سيارة في البرنامج تكون كائن (object) من هذا الكلاس.

# التغليف (Encapsulation)
```python
class Vehicle:
    def __init__(self, brand, speed):
        self.__brand = brand      # خاص (Private)
        self.__speed = speed      # خاص (Private)

    def get_brand(self):
        return self.__brand

    def set_speed(self, speed):
        if speed >= 0:
            self.__speed = speed

    def get_speed(self):
        return self.__speed
```

# الوراثة (Inheritance)
```python
class Car(Vehicle):
    def __init__(self, brand, speed, fuel_type):
        super().__init__(brand, speed) 
        self.fuel_type = fuel_type

    def display_info(self):
        print(f"Car: {self.get_brand()}, Speed: {self.get_speed()}, Fuel: {self.fuel_type}")
```
