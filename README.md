# Agri-data-systems
#SurveyCTO Sample – Daniel Mutembesa

## Overview
This package contains representative sample materials demonstrating my ability to design, implement, and quality-assure SurveyCTO/XLSForm instruments and the associated data cleaning workflow for coffee farmer surveys.

These samples reflect patterns from my work across:
1) Digital Coffee Fund (coffee farmer profiling, yield tracking, CSA practices and advisory),
2) M‑Vet Platform (livestock syndromic surveillance and field reporting workflows).

## Files included
- `coffee_csa_baseline_survey_sample.xlsx`  
  A working XLSForm (SurveyCTO/ODK compatible) with multilingual labels (English + Luganda), constraints, and an embedded “AI-lite” advisory logic using calculated fields and conditional notes.

- `baseline_cleaning.do`  
  Example Stata cleaning script for baseline survey exports (deduplication, derived indicators, and analysis-ready outputs).

## My contributions (authorship)
I am the primary author of these sample files. In my production work, instruments are often co-designed with program teams and field partners; my role typically covers:

- End-to-end XLSForm design: skips, constraints, calculations, repeat groups (as needed)
- Multilingual implementation: Luganda-first and additional Ugandan languages in production
- Enumerator UX: flow optimization, error prevention, validation messages
- Data QA workflows: daily sync checks, back-check plans, and issue logs
- Integration: exporting/ingesting SurveyCTO data into Python pipelines and analytics

## Features demonstrated in the XLSForm
- Conditional logic and validation constraints
- Geo-tagging (GPS)
- CSA-relevant questions (mulching, shade trees, yields)
- A simple advisory module triggered by derived “risk_score”
- English and Luganda labels

## Tools
SurveyCTO / ODK, Stata, Python (FastAPI + data pipelines), GIS tooling (QGIS) in broader deployments.
