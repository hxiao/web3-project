package web3.project



import org.junit.*
import grails.test.mixin.*

@TestFor(LeagueController)
@Mock(League)
class LeagueControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/league/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.leagueInstanceList.size() == 0
        assert model.leagueInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.leagueInstance != null
    }

    void testSave() {
        controller.save()

        assert model.leagueInstance != null
        assert view == '/league/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/league/show/1'
        assert controller.flash.message != null
        assert League.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/league/list'

        populateValidParams(params)
        def league = new League(params)

        assert league.save() != null

        params.id = league.id

        def model = controller.show()

        assert model.leagueInstance == league
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/league/list'

        populateValidParams(params)
        def league = new League(params)

        assert league.save() != null

        params.id = league.id

        def model = controller.edit()

        assert model.leagueInstance == league
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/league/list'

        response.reset()

        populateValidParams(params)
        def league = new League(params)

        assert league.save() != null

        // test invalid parameters in update
        params.id = league.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/league/edit"
        assert model.leagueInstance != null

        league.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/league/show/$league.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        league.clearErrors()

        populateValidParams(params)
        params.id = league.id
        params.version = -1
        controller.update()

        assert view == "/league/edit"
        assert model.leagueInstance != null
        assert model.leagueInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/league/list'

        response.reset()

        populateValidParams(params)
        def league = new League(params)

        assert league.save() != null
        assert League.count() == 1

        params.id = league.id

        controller.delete()

        assert League.count() == 0
        assert League.get(league.id) == null
        assert response.redirectedUrl == '/league/list'
    }
}
