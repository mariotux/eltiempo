### After clone the repository:

- Install dependencies
- Create a config.yml in the root path.:
- Add values to the config file.

config.yml
```
lang: 'es'
division_id: '<division_id>'
affiliate_id: '<affiliate_id>'
```

- Run the program

```
$ ./eltiempo -today 'some_location'
```

- Command format

```
$ ./eltiempo <option> <location>
```

- Available options:
    - '-today'
    - '-av_min'
    - '-av_max'

- The available locations depend on the division_id configuration.
