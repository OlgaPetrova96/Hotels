package hotels

class Country {

    String name
    String capital

    static hasMany = [hotels: Hotel]

    static constraints = {
        name blank: false, maxSize: 255, unique: true
        capital blank: false, maxSize: 128

    }

    @Override
    String toString() {
        return name
    }
}
