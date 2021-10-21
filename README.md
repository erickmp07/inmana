# inmana

API to prevent loss of restaurants supplies.

## Table of Contents

- [Install](#install)
- [Usage](#usage)
- [Technologies](#technologies)
- [API](#api)
- [Contributing](#contributing)
- [License](#license)

## Install

Prerequisites:

Download and install [Elixir](https://elixir-lang.org/install.html) and [Phoenix](https://hexdocs.pm/phoenix/installation.html#content).

- First, clone the repository:
```bash
git clone https://github.com/erickmp07/inmana.git
```

- Install its dependencies:
```bash
cd inmana
mix deps.get
```

- Create and migrate the database:
```bash
mix ecto.setup
```

## Usage

Start Phoenix endpoint:
```bash
mix phx.server
```

The application can be accessed at [`localhost:4000`](http://localhost:4000).

## Technologies

This project was developed with the following technologies:

- [Elixir](https://elixir-lang.org/)
- [Phoenix](https://www.phoenixframework.org/)
- [Erlang](https://www.erlang.org/)
- [Credo](https://github.com/rrrene/credo/)
- [Jason](https://github.com/michalmuskala/jason)
- [PostgreSQL](https://www.postgresql.org/)

## API

The available routes are:
```bash
# POST (JSON) - Create Restaurant
http://localhost:{port}/api/restaurants
body: {
  "name": "Restaurant's name",
	"email": "email@domain.com"
}

# POST (JSON) - Create Supply
http://localhost:{port}/api/supplies
body: {
  "description": "Supply's description",
	"expiration_date": "2021-01-01",
	"responsible": "Name",
	"restaurant_id": "1c671fb7-39b1-4234-ac10-7b7e6651ade9"
}

# GET - Show Supply
http://localhost:{port}/api/supplies/:id
```

## Contributing

PRs and stars are always welcome.

To ask a question, please [contact me](mailto:erimacedo_92@hotmail.com).

## License

Licensed under [MIT](LICENSE) license.