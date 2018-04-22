package hotels

class Hotel {

    String name
    Country country
    Integer stars
    String url

    static constraints = {
        name blank: false, maxSize: 255, unique: true
        stars blank: false, min: 1, max: 5
        url blank: true, matches: "^(http:\\/\\/|https:\\/\\/)[\\w\\d\\-\\.\\/]*", nullable: true
    }

}
