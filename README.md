### 대학논술문항을 활용한 거대언어모델의 한국어 서술형 평가(노성훈, 김주애, 조한서)


### Evaluation of Large Language Models’ Korean Descriptive Writing Using University Essay Questions(Seong-Hun Noh, Ju-ae Kim, Han-Seo Jo)


[Conference](https://sites.google.com/view/hclt2024), [Proceedings](https://drive.google.com/file/d/1hrJjJK4cIrJ3v0XHH-7Jt2Kt65kEyOD1/view)

contact: starkensin@gmail.com

----


### install rye
```sh
./install_rye_mac.sh
```

OR

https://rye.astral.sh/guide/installation/

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
