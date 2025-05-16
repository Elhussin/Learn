"""
أهم مفاهيم OOP:
التغليف (Encapsulation):
 -إخفاء التفاصيل الداخلية للكائن، وعدم السماح بالوصول المباشر للبيانات إلا من خلال وظائف خاصة.

الوراثة (Inheritance):
 -كائن جديد يمكنه أن يرث خصائص ووظائف من كائن آخر.

تعدد الأشكال (Polymorphism): 
 -إمكانية استخدام نفس الوظيفة بأشكال مختلفة حسب السياق.

التجريد (Abstraction): 
 - إخفاء التفاصيل غير المهمة وإظهار فقط المهم للمستخدم.
 - `ABC` معناها أن هذا الكلاس أساسي ومجرد (Abstract Base Class).
 - أي لا يمكن إنشاء كائن (object) منه مباشرة.
"""

# التغليف (Encapsulation)

class Vehicle:
    def __init__(self, brand, speed):
        self.__brand = brand      #  __ == (Private)
        self.__speed = speed      #  (Private)

    def get_brand(self):
        return self.__brand

    def set_speed(self, speed):
        if speed >= 0:
            self.__speed = speed

    def get_speed(self):
        return self.__speed

# الوراثة (Inheritance)
class Car(Vehicle):
    def __init__(self, brand, speed, fuel_type):
        super().__init__(brand, speed) 
        self.fuel_type = fuel_type

    def display_info(self):
        print(f"Car: {self.get_brand()}, Speed: {self.get_speed()}, Fuel: {self.fuel_type}")

# تعدد الأشكال (Polymorphism)
class Bike(Vehicle):
    def display_info(self):
        print(f"Bike: {self.get_brand()}, Speed: {self.get_speed()}")


# التجريد (Abstraction)
from abc import ABC, abstractmethod

# - هذه السطر يستورد أدوات من مكتبة `abc`، وهي اختصار لـ **Abstract Base Classes** (الكلاسات الأساسية المجرّدة).
# - نستخدمها لما نريد نُنشئ كلاس لا يُستخدم مباشرة، بل يكون قاعدة لكلاسات أخرى.

# ---


class AbstractVehicle(ABC):
    @abstractmethod
    def move(self):
        pass

class Boat(AbstractVehicle):
    def __init__(self, name, capacity):
        self.name = name
        self.capacity = capacity

    def move(self): # 
        print(f"{self.name} sails on water with capacity of {self.capacity} people.")


# تجربة الكلاسات
if __name__ == "__main__":
    car = Car("Toyota", 120, "Gas")
    bike = Bike("Yamaha", 80)
    boat = Boat("Sea Queen", 20)

    car.display_info()
    bike.display_info()
    boat.move()
