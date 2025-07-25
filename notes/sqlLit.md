### to creat sql lit file
``` touch filename```

### for multai inseart
```vim inserts.sql```

### columen mode to good view 
```.mode columns```
```.headers yes ```



<!-- shell command  -->

```from flights.models import Flight```
```f= Flight(origin="New york",destination="london", duration=415) ```
```f.save()```
```flights=Flight.objects.all()```
<!-- for frist  -->
`flight = flights.first()`

### to delat from db 
`flight.delete()`

<!-- to creat comman from shell to call class then creat add dat to airport table -->
from flights.models import *
jfk= Airport(code="JFK",city="New York")
jfk.save()

lhr= Airport(code="LHR",city="London")
lhr.save()

cdg= Airport(code="CDG",city="Paris")
cdg.save()

nrt= Airport(code="NRT",city="Tokyo")
nrt.save()
<!-- to add date to table flifgt -->
```f= Flight(origin=jfk,destination=lhr, duration=415) ```
```f.save()```
<!-- to check last enter  -->
```f```

### to ge all dat in class
Airport.objects.all()
### to ge filter from  dat in class

```Airport.objects.filter(city="New York")```
### to get last resualt
```Airport.objects.filter(city="New York").first()```
### to get if onle one rusalt

```Airport.objects.get(city="New York")```


