import streamlit as st
import os
import sqlite3
import pandas as pd

# --- PAGE CONFIG ---
st.set_page_config(
    page_title="Database Mastery Dashboard",
    page_icon="🗄️",
    layout="wide",
    initial_sidebar_state="expanded",
)

# --- STYLING ---
st.markdown("""
    <style>
    .main { background-color: #0e1117; }
    .stMarkdown h1 { color: #00d4ff; }
    .stMarkdown h2 { color: #ff007f; }
    .stMarkdown h3 { color: #00ff88; }
    .status-box {
        background-color: #1e2130;
        padding: 20px;
        border-left: 5px solid #00d4ff;
        border-radius: 5px;
        margin-bottom: 20px;
    }
    .sql-output {
        background-color: #000000;
        color: #00ff00;
        padding: 10px;
        border-radius: 5px;
        font-family: 'Courier New', Courier, monospace;
    }
    </style>
    """, unsafe_allow_html=True)

# --- CONSTANTS ---
BASE_DIR = os.path.dirname(os.path.abspath(__file__))

def get_phases():
    phases = [d for d in os.listdir(BASE_DIR) if os.path.isdir(os.path.join(BASE_DIR, d)) and d.startswith("Phase_")]
    phases.sort()
    return phases

def get_topics(phase):
    phase_path = os.path.join(BASE_DIR, phase)
    topics = [d for d in os.listdir(phase_path) if os.path.isdir(os.path.join(phase_path, d))]
    topics.sort()
    return topics

def load_file(path):
    if os.path.exists(path):
        with open(path, "r", encoding="utf-8") as f:
            return f.read()
    return None

# --- SQL ENGINE (SQLite) ---
def run_sql(query):
    try:
        conn = sqlite3.connect(":memory:")
        # We could pre-populate with some data if needed
        df = pd.read_sql_query(query, conn)
        conn.close()
        return df, None
    except Exception as e:
        return None, str(e)

# --- SIDEBAR ---
st.sidebar.title("🗄️ Database Mastery")
st.sidebar.markdown("From Zero to Database Engineer")

phases = get_phases()
selected_phase = st.sidebar.selectbox("Select Learning Phase", phases)

topics = get_topics(selected_phase)
selected_topic = st.sidebar.radio("Select Topic", topics)

st.sidebar.divider()
st.sidebar.info("Progress: 15% Complete")

# --- MAIN CONTENT ---
if selected_topic:
    st.title(f"🚀 {selected_topic.replace('_', ' ').title()}")
    topic_path = os.path.join(BASE_DIR, selected_phase, selected_topic)

    theory = load_file(os.path.join(topic_path, "theory.md"))
    practice = load_file(os.path.join(topic_path, "practice.sql"))
    project = load_file(os.path.join(topic_path, "mini_project.md"))
else:
    st.title("🚀 Select a Topic")
    theory, practice, project = None, None, None

tab1, tab2, tab3 = st.tabs(["📖 Theory", "💻 SQL Practice", "🏗️ Mini Project"])

with tab1:
    if theory:
        st.markdown(theory)
    else:
        st.warning("Theory content coming soon!")

with tab2:
    st.header("Execute SQL Queries")
    if practice:
        st.code(practice, language="sql")
    
    query = st.text_area("Write your SQL here (SQLite syntax):", height=150, placeholder="SELECT * FROM ...")
    if st.button("Run Query"):
        if query:
            df, error = run_sql(query)
            if error:
                st.error(f"Error: {error}")
            else:
                st.success("Query Executed Successfully!")
                st.dataframe(df, use_container_width=True)
        else:
            st.warning("Please enter a query.")

with tab3:
    if project:
        st.markdown(project)
    else:
        st.info("Project guidelines coming soon!")

# --- FOOTER ---
st.divider()
st.caption("© 2026 Database Mastery Guide | Practice makes perfect.")
