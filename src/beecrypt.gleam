import gleam/crypto
import gleam/erlang/charlist.{type Charlist}
import gleam/string

pub fn hash(password: String) -> String {
  let salt = generate_salt()
  hash_with_salt(password, salt)
}

pub fn verify(password: String, hash: String) -> Bool {
  let salt = string.slice(hash, at_index: 0, length: 29)
  let hashed = hash_with_salt(password, salt)
  crypto.secure_compare(<<hash:utf8>>, <<hashed:utf8>>)
}

type BcrypeErlangError

fn generate_salt() -> String {
  let assert Ok(salt) = gen_salt()
  charlist.to_string(salt)
}

fn hash_with_salt(password: String, salt: String) -> String {
  let assert Ok(hash) = hashpw(password, salt)
  charlist.to_string(hash)
}

@external(erlang, "bcrypt", "gen_salt")
fn gen_salt() -> Result(Charlist, BcrypeErlangError)

@external(erlang, "bcrypt", "hashpw")
fn hashpw(a: String, b: String) -> Result(Charlist, BcrypeErlangError)
