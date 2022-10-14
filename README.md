# Access tokens

A very simple wrapper around [openssl](https://github.com/openssl/openssl) to manage access tokens on your local machine.

## Goal

Never save the unencrypted token value to disk.

## Example

### Add token

```sh
$ ./access-tokens.sh add path/to/my/token/file
Created empty directory: path/to/my/token
Enter access token value:  # type 'value'
enter aes-256-cbc encryption password:  # type 'password'
Verifying - enter aes-256-cbc encryption password:  # type 'password' again
```

### View token

```sh
$ ./access-tokens.sh view path/to/my/token/file
enter aes-256-cbc decryption password:  # type 'password'
value
```
