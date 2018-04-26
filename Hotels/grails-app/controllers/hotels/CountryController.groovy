package hotels

import grails.validation.ValidationException

import static org.springframework.http.HttpStatus.CREATED
import static org.springframework.http.HttpStatus.OK


class CountryController {

    CountryService countryService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index() {
        [countryList: Country.list(),
         countryCount: Country.count()]
    }

    def show(Long id) {
        [country : Country.get(id)]
    }

    def create() {
        [country: new Country()]
    }

    def save(Country country) {

        try {
            countryService.save(country)
        } catch (ValidationException e) {
            [errors: country.errors, view:'create']
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'country.label', default: 'Country'), country.id])
                redirect(action: "index")
            }
            '*' { [country: country, status: CREATED] }
        }
    }

    def edit(Long id) {
        [country: countryService.get(id)]
    }

    def update(Country country) {

        try {
            countryService.save(country)
        } catch (ValidationException e) {
            [errors: country.errors, view:'edit']
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'country.label', default: 'Country'), country.id])
                redirect(action: "index")
            }
            '*'{ [country: country, status: OK] }
        }
    }

    def delete(Long id) {

        countryService.delete(id)
        redirect(action: "index")

    }
}
