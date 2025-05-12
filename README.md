# beecrypt 🐝

> [!IMPORTANT]
> Argon2 is a better password hashing algorithm, so unless you _really_ know
> that you need bcrypt you should use the [argus](https://github.com/Pevensie/argus)
> package instead of this one.

[![Package Version](https://img.shields.io/hexpm/v/beecrypt)](https://hex.pm/packages/beecrypt)
[![Hex Docs](https://img.shields.io/badge/hex-docs-ffaff3)](https://hexdocs.pm/beecrypt/)

Buzzing Gleam bindings to the [Erlang bcrypt hashing library][erlang-bcrypt]!

Unfortunately Erlang's bcrypt library does not currently support Windows.

## Usage

Add it to your Gleam project:
```sh
gleam add beecrypt
```

And get hashing:

```gleam
// The user gives us a password
let user_password = "blink182"

// We salt and hash the password
let hash = beecrypt.hash(user_password)

// The hash can be used to check if future passwords match
beecrypt.verify("blink182", hash) // -> True
beecrypt.verify("password", hash) // -> False
```

API documentation can be found at <https://hexdocs.pm/beecrypt>, and further
documentation can be found in the [Erlang library's repository][erlang-bcrypt].


[erlang-bcrypt]: https://github.com/erlangpack/bcrypt
