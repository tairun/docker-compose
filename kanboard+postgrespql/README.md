# Kanboard with Postgresql backend

## Quickstart
1. Download the ``docker-compose.yml`` file into its own directory (``wget -O ...``).
2. Fromt the command line change into that directory.
3. Run: ``docker-compose up``.
4. Wait for db migration
5. Access the web interface at http://``<your-host-ip>:``8081 with ``admin/admin``

## Customization
All the environmend variables listed in the docker-compose file you are required to change. Additional configuration options can be extracted from the docs of the original images.

### Required
**Postgresql:**
Name | Values | Description
-----|-------|------------
``POSTGRES_PASSWORD`` | ``<Some string>`` | Sets the superuser Password for the postgresql container.

**Kanboard**:
Name | Values | Description
-----|-------|------------
``DATABASE_URL`` | ``postgres://postgres@postgresql:5432/kanboard`` | Sets the alternative database connection (defult is sqlite)

## Additional information
### Updating Kanboard
- Pull the new image
- Remove the old container
- Restart a new container with the same volumes


## Images used
- Postgresql - https://hub.docker.com/_/postgres/
- Kanboard - https://hub.docker.com/r/kanboard/kanboard/
