```python
# Instala a biblioteca.
!pip install jupysql duckdb-engine
```

    Collecting jupysql
      Obtaining dependency information for jupysql from https://files.pythonhosted.org/packages/06/97/2c4d69d3ac902f7e8ff4f37e0225634a454cfb557c2c3c7f99011ddabf5e/jupysql-0.10.7-py3-none-any.whl.metadata
      Downloading jupysql-0.10.7-py3-none-any.whl.metadata (5.6 kB)
    Collecting duckdb-engine
      Obtaining dependency information for duckdb-engine from https://files.pythonhosted.org/packages/fa/72/fc2582b2297215499ed9a20cc232afa1fb2dd2407aa220fb4f7dc62ae487/duckdb_engine-0.10.0-py3-none-any.whl.metadata
      Downloading duckdb_engine-0.10.0-py3-none-any.whl.metadata (7.9 kB)
    Collecting prettytable (from jupysql)
      Obtaining dependency information for prettytable from https://files.pythonhosted.org/packages/4d/81/316b6a55a0d1f327d04cc7b0ba9d04058cb62de6c3a4d4b0df280cbe3b0b/prettytable-3.9.0-py3-none-any.whl.metadata
      Downloading prettytable-3.9.0-py3-none-any.whl.metadata (26 kB)
    Requirement already satisfied: sqlalchemy in c:\users\crisl\anaconda3\lib\site-packages (from jupysql) (1.4.39)
    Collecting sqlparse (from jupysql)
      Downloading sqlparse-0.4.4-py3-none-any.whl (41 kB)
         ---------------------------------------- 0.0/41.2 kB ? eta -:--:--
         ---------------------------------------- 41.2/41.2 kB 1.9 MB/s eta 0:00:00
    Requirement already satisfied: ipython-genutils>=0.1.0 in c:\users\crisl\anaconda3\lib\site-packages (from jupysql) (0.2.0)
    Requirement already satisfied: jinja2 in c:\users\crisl\anaconda3\lib\site-packages (from jupysql) (3.1.2)
    Collecting sqlglot>=11.3.7 (from jupysql)
      Obtaining dependency information for sqlglot>=11.3.7 from https://files.pythonhosted.org/packages/9d/78/cf8af83b0069f23a91276275969c5a92140e980c91e2732e894beb3144fe/sqlglot-20.5.0-py3-none-any.whl.metadata
      Downloading sqlglot-20.5.0-py3-none-any.whl.metadata (16 kB)
    Collecting ploomber-core>=0.2.7 (from jupysql)
      Obtaining dependency information for ploomber-core>=0.2.7 from https://files.pythonhosted.org/packages/9b/a1/9d203c4a6c9cad837856651b793d8391a6cb4bed2dcdeecbe4b83d4be928/ploomber_core-0.2.19-py3-none-any.whl.metadata
      Downloading ploomber_core-0.2.19-py3-none-any.whl.metadata (498 bytes)
    Collecting jupysql-plugin (from jupysql)
      Obtaining dependency information for jupysql-plugin from https://files.pythonhosted.org/packages/74/0d/95adf02c5fe3591948a57b84d569737ea92409ad9aaf85a9445a50eeda8a/jupysql_plugin-0.3.1-py3-none-any.whl.metadata
      Downloading jupysql_plugin-0.3.1-py3-none-any.whl.metadata (6.8 kB)
    Collecting duckdb>=0.4.0 (from duckdb-engine)
      Obtaining dependency information for duckdb>=0.4.0 from https://files.pythonhosted.org/packages/a6/7a/e15904563fa63d7d3cc542a697377486ddea8ba4914810391812ffefc9b1/duckdb-0.9.2-cp311-cp311-win_amd64.whl.metadata
      Downloading duckdb-0.9.2-cp311-cp311-win_amd64.whl.metadata (798 bytes)
    Requirement already satisfied: click in c:\users\crisl\anaconda3\lib\site-packages (from ploomber-core>=0.2.7->jupysql) (8.0.4)
    Requirement already satisfied: pyyaml in c:\users\crisl\anaconda3\lib\site-packages (from ploomber-core>=0.2.7->jupysql) (6.0)
    Collecting posthog (from ploomber-core>=0.2.7->jupysql)
      Obtaining dependency information for posthog from https://files.pythonhosted.org/packages/3b/82/441cb77a43499661228048dcd0d21e0ae3235b442d0f1b9b606e29c2a5ed/posthog-3.1.0-py2.py3-none-any.whl.metadata
      Downloading posthog-3.1.0-py2.py3-none-any.whl.metadata (2.0 kB)
    Requirement already satisfied: greenlet!=0.4.17 in c:\users\crisl\anaconda3\lib\site-packages (from sqlalchemy->jupysql) (2.0.1)
    Requirement already satisfied: MarkupSafe>=2.0 in c:\users\crisl\anaconda3\lib\site-packages (from jinja2->jupysql) (2.1.1)
    Requirement already satisfied: wcwidth in c:\users\crisl\anaconda3\lib\site-packages (from prettytable->jupysql) (0.2.5)
    Requirement already satisfied: colorama in c:\users\crisl\anaconda3\lib\site-packages (from click->ploomber-core>=0.2.7->jupysql) (0.4.6)
    Requirement already satisfied: requests<3.0,>=2.7 in c:\users\crisl\anaconda3\lib\site-packages (from posthog->ploomber-core>=0.2.7->jupysql) (2.31.0)
    Requirement already satisfied: six>=1.5 in c:\users\crisl\anaconda3\lib\site-packages (from posthog->ploomber-core>=0.2.7->jupysql) (1.16.0)
    Collecting monotonic>=1.5 (from posthog->ploomber-core>=0.2.7->jupysql)
      Downloading monotonic-1.6-py2.py3-none-any.whl (8.2 kB)
    Collecting backoff>=1.10.0 (from posthog->ploomber-core>=0.2.7->jupysql)
      Downloading backoff-2.2.1-py3-none-any.whl (15 kB)
    Requirement already satisfied: python-dateutil>2.1 in c:\users\crisl\anaconda3\lib\site-packages (from posthog->ploomber-core>=0.2.7->jupysql) (2.8.2)
    Requirement already satisfied: charset-normalizer<4,>=2 in c:\users\crisl\anaconda3\lib\site-packages (from requests<3.0,>=2.7->posthog->ploomber-core>=0.2.7->jupysql) (2.0.4)
    Requirement already satisfied: idna<4,>=2.5 in c:\users\crisl\anaconda3\lib\site-packages (from requests<3.0,>=2.7->posthog->ploomber-core>=0.2.7->jupysql) (3.4)
    Requirement already satisfied: urllib3<3,>=1.21.1 in c:\users\crisl\anaconda3\lib\site-packages (from requests<3.0,>=2.7->posthog->ploomber-core>=0.2.7->jupysql) (1.26.16)
    Requirement already satisfied: certifi>=2017.4.17 in c:\users\crisl\anaconda3\lib\site-packages (from requests<3.0,>=2.7->posthog->ploomber-core>=0.2.7->jupysql) (2023.11.17)
    Downloading jupysql-0.10.7-py3-none-any.whl (93 kB)
       ---------------------------------------- 0.0/93.3 kB ? eta -:--:--
       ---------------------------------------- 93.3/93.3 kB 5.2 MB/s eta 0:00:00
    Downloading duckdb_engine-0.10.0-py3-none-any.whl (46 kB)
       ---------------------------------------- 0.0/46.0 kB ? eta -:--:--
       -------------------------- ------------- 30.7/46.0 kB ? eta -:--:--
       ---------------------------------------- 46.0/46.0 kB 567.6 kB/s eta 0:00:00
    Downloading duckdb-0.9.2-cp311-cp311-win_amd64.whl (10.3 MB)
       ---------------------------------------- 0.0/10.3 MB ? eta -:--:--
       -- ------------------------------------- 0.6/10.3 MB 17.8 MB/s eta 0:00:01
       ----- ---------------------------------- 1.4/10.3 MB 14.7 MB/s eta 0:00:01
       -------- ------------------------------- 2.1/10.3 MB 18.9 MB/s eta 0:00:01
       ----------- ---------------------------- 3.0/10.3 MB 19.1 MB/s eta 0:00:01
       --------------- ------------------------ 4.0/10.3 MB 19.6 MB/s eta 0:00:01
       ------------------- -------------------- 5.1/10.3 MB 20.3 MB/s eta 0:00:01
       ----------------------- ---------------- 6.1/10.3 MB 21.8 MB/s eta 0:00:01
       ----------------------------- ---------- 7.6/10.3 MB 23.0 MB/s eta 0:00:01
       ------------------------------------ --- 9.5/10.3 MB 25.2 MB/s eta 0:00:01
       ---------------------------------------  10.3/10.3 MB 24.2 MB/s eta 0:00:01
       ---------------------------------------  10.3/10.3 MB 24.2 MB/s eta 0:00:01
       ---------------------------------------- 10.3/10.3 MB 20.5 MB/s eta 0:00:00
    Downloading ploomber_core-0.2.19-py3-none-any.whl (22 kB)
    Downloading sqlglot-20.5.0-py3-none-any.whl (343 kB)
       ---------------------------------------- 0.0/343.7 kB ? eta -:--:--
       --------------------------------------- 343.7/343.7 kB 22.2 MB/s eta 0:00:00
    Downloading jupysql_plugin-0.3.1-py3-none-any.whl (376 kB)
       ---------------------------------------- 0.0/376.8 kB ? eta -:--:--
       --------------------------------------- 376.8/376.8 kB 22.9 MB/s eta 0:00:00
    Downloading prettytable-3.9.0-py3-none-any.whl (27 kB)
    Downloading posthog-3.1.0-py2.py3-none-any.whl (37 kB)
    Installing collected packages: monotonic, sqlparse, sqlglot, prettytable, duckdb, backoff, posthog, duckdb-engine, ploomber-core, jupysql-plugin, jupysql
    Successfully installed backoff-2.2.1 duckdb-0.9.2 duckdb-engine-0.10.0 jupysql-0.10.7 jupysql-plugin-0.3.1 monotonic-1.6 ploomber-core-0.2.19 posthog-3.1.0 prettytable-3.9.0 sqlglot-20.5.0 sqlparse-0.4.4
    


```python
# Importa a biblioteca JupySQL.
%load_ext sql
```

    [32mDeploy AI and data apps for free on Ploomber Cloud! Learn more: https://docs.cloud.ploomber.io/en/latest/quickstart/signup.html[0m
    


```python
from pathlib import Path
from urllib.request import urlretrieve

if not Path("penguins.csv").is_file():
    urlretrieve(
        "https://raw.githubusercontent.com/mwaskom/seaborn-data/master/penguins.csv",
        "penguins.csv",
    )
```


```python
%sql duckdb://
```


<span style="None">Connecting to &#x27;duckdb://&#x27;</span>



```python
%sql SELECT * FROM penguins.csv LIMIT 3
```


<span style="None">Running query in &#x27;duckdb://&#x27;</span>





<table>
    <thead>
        <tr>
            <th>species</th>
            <th>island</th>
            <th>bill_length_mm</th>
            <th>bill_depth_mm</th>
            <th>flipper_length_mm</th>
            <th>body_mass_g</th>
            <th>sex</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Adelie</td>
            <td>Torgersen</td>
            <td>39.1</td>
            <td>18.7</td>
            <td>181</td>
            <td>3750</td>
            <td>MALE</td>
        </tr>
        <tr>
            <td>Adelie</td>
            <td>Torgersen</td>
            <td>39.5</td>
            <td>17.4</td>
            <td>186</td>
            <td>3800</td>
            <td>FEMALE</td>
        </tr>
        <tr>
            <td>Adelie</td>
            <td>Torgersen</td>
            <td>40.3</td>
            <td>18.0</td>
            <td>195</td>
            <td>3250</td>
            <td>FEMALE</td>
        </tr>
    </tbody>
</table>




```python

```
