# gapyear_llm


### install rye
```sh
./install_rye_mac.sh
```

### set .env
```
make .env file on working directory.

write your api key

e.g)
OPENAI_API_KEY="YOUR_KEY"
ANTHROPIC_API_KEY="YOUR_KEY"
```

### run
```sh
rye sync
rye run python -m gapyear_llm
```
