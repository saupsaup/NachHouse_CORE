# Help k git
```bash
# presun do priečinka CORE
# vytvorenie nového git repozitára (vznikne CORE/.git)
# pridanie všetkých súborov do staged changes
# vytvorenie prvého commitu so všetkými súbormi v CORE
cd NachHouse/CORE
git init
git add .									
git commit -m "Initial commit"

# pripojenie k prázdnemu serverovému repozitáru 
git remote add origin git@github.com:saupsaup/NachHouse_CORE.git
git branch -M main 
# nastavíš si „upstream“ (preto -u), 
git push -u origin main
# takže nabudúce stačí iba:
git push 

---

### Vývoj novej funkcie - vytvorenie novej pracovnej VETVY = BRANCH
# z main
git checkout main
git checkout -b feature/v200-new-logging
# robíš zmeny...
git add .
git commit -m "V200: pridany logging XY"

# pripadne merge
# návrat na main + merge
git checkout main
git merge feature/v200-new-logging
git push

# Potom, keď je stav stabilný vytvorit TAG: 
git tag -a core-v200.2.0 -m "Release V200.2.0 – logging XY"
git push origin core-v200.2.0

# CORE – workflow vývoja
#	hlavná vetva je main
#	nové funkcie → feature/...
#	rýchle opravy → hotfix/...
#	stabilné verzie sa tagujú:
#				core-v200.1.0
#				core-v200.1.1
#				core-v201.0.0

# prechod medzi verziami
git checkout core-v200.1.0


--------- VSETKO NARAZ ------------------

# PRVÉ NASTAVENIE (len raz v CORE/)
cd NachHouse/CORE
# skontroluj, na akej vetve si
git status
# idealne: vetva 'main'
#Ak nemáš dev vetvu:
git checkout -b dev
git push -u origin dev

# 1️⃣ KAŽDODENNÁ PRÁCA – VÝVOJ NA dev
cd NachHouse/CORE
# prepni sa na vývojovú vetvu
git checkout dev
# zisti stav (čo je zmenené)
git status
# pridaj všetky zmeny
git add .
# commitni
git commit -m "Popis zmeny (napr. logovanie V200)"
# pošli na GitHub
git push
# (pri prvom push na novej vetve: git push -u origin dev)

# 2️⃣ KEĎ JE dev STABILNÉ → ZAPIS DO main
cd NachHouse/CORE
# ujisti sa, že máš aktuálny dev z GitHubu
git checkout dev
git pull
# prepnúť na main
git checkout main
# stiahnuť aktuálny main
git pull
# spojiť dev → main
git merge dev
# ak treba, vyrieš konflikty, potom:
git add .
git commit -m "Merge dev do main"
# push na GitHub
git push

# 3️⃣ VYTVORENIE RELEASE VETVY V200.1
# Použiješ, keď chceš spraviť konkrétnu verziu V200.1 na doladenie.
cd NachHouse/CORE
# z hlavnej stabilnej vetvy
git checkout main
git pull
# vytvor release vetvu z main - a hned ta do nej prepne
git checkout -b V200.1
# push na GitHub a nastavenie upstream
git push -u origin V200.1

# Odteraz všetky bugfixy pre V200.1 robíš na tejto vetve:

git checkout V200.1
... úpravy v CORE/V200/APP ...
git add .
git commit -m "Fix: niečo vo V200.1"
git push

# 4️⃣ OZAČENIE RELEASE – TAG (napr. core-v200.1.0)
# Keď je stav vetvy V200.1 pripravený ako release:
cd NachHouse/CORE
# uisti sa, že si na správnej vetve
git checkout V200.1
git pull
# vytvor tag (release nálepku)
git tag -a core-v200.1.0 -m "Release V200.1.0"
# pošli tag na GitHub
git push origin core-v200.1.0



# Neskôr hotfix na tej istej vetve:
git checkout V200.1
git pull
... fix ...
git add .
git commit -m "Hotfix: ..."
git push

# novy tag
git tag -a core-v200.1.1 -m "Release V200.1.1"
git push origin core-v200.1.1

# 5️⃣ PREPNUTIE NA KONKRÉTNU VERZIU PRED BUILDOM
# a) Build poslednej stabilnej verzie:
cd NachHouse/CORE
git checkout main
git pull
# teraz build v Mosaic

# b) Build vývojovej verzie:
cd NachHouse/CORE
git checkout dev
git pull
# build v Mosaic

# c) Build konkrétnej release vetvy (napr. V200.1):
cd NachHouse/CORE
git checkout V200.1
git pull
# build v Mosaic

# d) Build presne konkrétneho tagu (stav 1:1 ako pri release):
cd NachHouse/CORE
git checkout core-v200.1.0
# build v Mosaic (nič NEUPRAVOVAŤ, lebo je to „stará fotka“)

# 6️⃣ RÝCHLA POMÔCKA – NA NALepenie NA MONITOR 😄
# vývoj:
git checkout dev
git pull
git add .
git commit -m "..."
git push

# stabilna verzia:
git checkout main
git pull
git merge dev
git push

# nova release vetva:
git checkout main
git pull
git checkout -b V200.1
git push -u origin V200.1

# release tag:
git checkout V200.1
git pull
git tag -a core-v200.1.0 -m "Release V200.1.0"
git push origin core-v200.1.0

 

---------------------------


# 2. !KEĎ JE dev STABILNÉ → ZAPIS DO main



git status
# Zobraziť všetky ignorované súbory (globálne)
git status --ignored
# Zobraziť všetky ignorované súbory (short)
git status --ignored -s 
# Overenie ignorovaných súborov
git check-ignore -v cesta/k_suboru
# stiahni zmeny z GitHubu
git pull

# git rm -r --cached *.PNG *.png || true      # 2. vyhoď všetky PNG z indexu (repozitár), ale nechaj ich na disku
# git rm -r --cached Dev_V200/**/*.PNG Dev_V200/**/*.png || true
#  # git odstrani uplne vsetko co je aktualne sledovane v aktualnom priecinku aj -r = 
git rm -r --cached .       
# pridaj zmeny a commitni
git add .
git commit -m "Reset repo" 
# odošli na GitHub
git push           


# Vytvorenie novej vetvy
git checkout -b feature/nazov-funkcie
# Vytvorenie tagu (verzia V200 alebo V201)
git tag -a core-v200.1.0 -m "Release V200.1.0"
git push origin core-v200.1.0

# zobraz stav (sledované / ignorované súbory)
git status

## full reset repository
rm -rf .git
git init
git add .
git commit -m "Initial commit"
git branch -M main 
git git remote add origin git@github.com:saupsaup/NachHouse_CORE.git
git push -u origin main --force
git status

# 🅾️ 3. BRUTÁLNA METÓDA – resetovať celý GitHub na jeden prázdny commit
# Ak chceš, aby aj história zmizla (nový čistý repozitár bez minulej histórie):
git checkout --orphan empty
git rm -rf .
echo "# Start" > README.md
git add README.md
git commit -m "Initial empty commit"
git push --force origin empty:main
# ➡️ Všetky commity preč
# ➡️ Všetky subory preč
# ➡️ Len README zostane


# Overiť, či konkrétny súbor je ignorovaný
git check-ignore -v <cesta/k/suboru>
git check-ignore -v Dev_V200/200/_Nh_DEV.st


# ============== ULOHA ==============================
Spravíme to konzervatívne a prehľadné:
1️⃣ skontrolujeme zmeny
2️⃣ commitneme V21 (už je skoro celé v stagingu)
3️⃣ commitneme úpravy vo V200
4️⃣ pošleme všetko na GitHub (git push)

# KROK 1: Skontrolovať aktuálny stav repozitára
git status      # pre kontrolu, čo je staged / nestaged / untracked

# KROK 2: Doplniť do stagingu súbory patriace k novej verzii V21
# (ak existujú, inak git len zahlási, že súbor nenašiel)
git add V21.mpr      # pridá projektový súbor V21.mpr do stagingu (ak existuje)
git add nh_ver.txt   # pridá verziovací súbor, ak súvisí s V21 (akr existuje)
#Po tomto kroku budeš mať v stagingu:
#všetky tie V21/... (už tam sú) + prípadne V21.mpr + nh_ver.txt.

# KROK 3: Commitnúť novú verziu aplikácie V21
git commit -m "Pridanie novej verzie aplikácie V21"   # vytvorí commit so všetkým, čo je v stagingu (V21 + prípadne nh_ver.txt)

# KROK 4: Pridať do stagingu zmeny vo verzii V200
# (len to, čo už je zmenené; untracked súbory zatiaľ necháme tak)
git add V200/APP/APP.mak                     # pridá zmenený makefile V200 do stagingu
git add V200/APP/IOConfigurator/CONFIG.XML   # pridá zmenený konfigurák IOConfigurator
git add V200/APP/_Nh_SYS.st                  # pridá zmenený systémový súbor
git add V200/APP/_Nh_UTIL.st                 # pridá zmeny v utilitách
git add V200/APP/prgMain.ST                  # pridá hlavný program V200
git add V200/.vscode/numbered-bookmarks.json # pridá nastavenia bookmarkov vo VSCode

# KROK 5: Commitnúť zmeny vo verzii V200
git commit -m "Úpravy verzie V200 (APP, CONFIG, SYS, UTIL, prgMain)"   # commitne staging so zmenami V200

# ============================================
# KROK 6: Finálna kontrola pred pushom
# ============================================
git status    # mal by ukázať len untracked files alebo čistý working tree


# Untracked súbory (napr. 200.mpr, 200/, README_VSCode.md, rôzne APP.auto atď.) teraz zámerne NEcommitujeme – môžeš sa neskôr rozhodnúť, či ich chceš:
#buď pridať (git add ...)
#alebo ignorovať cez .gitignore.

# KROK 7: Poslať všetky lokálne commity na GitHub
git push      # odošle ten starý existujúci commit + nový commit s V21 + nový commit s V200 na origin/main


#Keď toto prebehne:
#main lokálne == main na GitHube
#V21 je pekne v jednom commite
#úpravy V200 sú v ďalšom, samostatnom commite
#untracked bordel ostal len lokálne, nič si tým nepokazil
# -------- ULOHA --------