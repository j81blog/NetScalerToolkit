# NetScalerToolkit Docs

This folder contains the Material for MkDocs source for the documentation site.

## Local Preview

From the repository root:

```powershell
python -m pip install -r Docs/requirements.txt
$env:NO_MKDOCS_2_WARNING = 'true'
python -m mkdocs serve -f Docs/mkdocs.yml
```

Open the local URL printed by MkDocs, usually:

```text
http://127.0.0.1:8000/
```

## Build Check

Run a static build before publishing:

```powershell
$env:NO_MKDOCS_2_WARNING = 'true'
python -m mkdocs build -f Docs/mkdocs.yml
```

The generated site is written to `Docs/site/`.
