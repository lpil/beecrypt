import gleeunit
import beecrypt
import gleam/string

pub fn main() {
  gleeunit.main()
}

pub fn hash_and_verify_test() {
  let hash = beecrypt.hash("password")

  // The hash has certain properties
  let assert True = hash != "password"
  let assert 60 = string.length(hash)

  // The hash can be verified
  let assert True = beecrypt.verify("password", hash)
  let assert False = beecrypt.verify("Password", hash)
  let assert False = beecrypt.verify("password ", hash)
  let assert False = beecrypt.verify("passwor", hash)
}
