using System;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace ClientAppliction
{
    public partial class frmMain : Form
    {
        //public
        public frmMain()
        {
            InitializeComponent();
            languages = new Maniyat.Languages();
            connection=new SqlConnection("SERVER=.\\MAYASSERVER;INITIAL CATALOG=TestLanguages;integrated security=true;");
            command=new SqlCommand("",connection);
            
            languages.Command=command;
            languages.DataReader=reader;

            loadLanguages();

            languages.DefaultLanguage = languages["العربية"];
            languages.SelectedLanguage = languages.DefaultLanguage;
            applicationConsts();
        }

        //private : functions region
        private void applicationConsts()
        {
            connection.Open();
            deleteConfirm = languages.DbReadWord(deleteConfirm);
            saveLanguageWords = languages.DbReadWord(saveLanguageWords);
            saveDefaultLanguageWords = languages.DbReadWord(saveDefaultLanguageWords);
            connection.Close();
        }

        private void loadLanguages()
        {
            connection.Open();
            languages.DbLoadLanguages();
            connection.Close();

            cmDefaultLanguage.Items.Clear();
            cmLanguage.Items.Clear();

            for (Int32 i = 0; i < languages.Count; i++)
            {
                languages[i].Command = command;
                languages[i].DataReader = reader;
                cmDefaultLanguage.Items.Add(languages[i]);
                cmLanguage.Items.Add(languages[i]);
            }
        }

        //priavate : class events

        private void btnAddLanguage_Click(object sender, EventArgs e)
        {
            Maniyat.Language language = new Maniyat.Language(0, txIName.Text, txIPrexfix.Text, txIDesc.Text, txIHelp.Text, chkRightToLeft.Checked);

            connection.Open();
            languages.DbAddLanguage(language);
            connection.Close();

            loadLanguages();

            txIDesc.Clear();
            txIHelp.Clear();
            txIName.Clear();
            txIPrexfix.Clear();
            chkRightToLeft.Checked = false;
        }

        private void btnGetWords_Click(object sender, EventArgs e)
        {
            String[][] table;
            Maniyat.Language lang;

            if (cmDefaultLanguage.SelectedIndex >= 0)
            {
                lang = (Maniyat.Language)cmDefaultLanguage.SelectedItem;

                dgvWords.Columns.Clear();
                dgvWords.Rows.Clear();

                dgvWords.Columns.Add("clmnId", "Id");
                dgvWords.Columns.Add("clmnDef", cmDefaultLanguage.SelectedItem.ToString());

                dgvWords.Columns[0].Width = Convert.ToInt32(dgvWords.Width * .30);
                dgvWords.Columns[1].Width = Convert.ToInt32(dgvWords.Width * .62);

                connection.Open();
                table = lang.DbGetWords();
                connection.Close();

                for (Int32 i = 0; i < table[1].Length; i++)
                    dgvWords.Rows.Add(table[0][i], table[1][i]);
            }
            else
                return;

            if (cmLanguage.SelectedIndex >= 0)
            {
                lang = (Maniyat.Language)cmLanguage.SelectedItem;

                dgvWords.Columns.Add("clmnLang", cmLanguage.SelectedItem.ToString());

                dgvWords.Columns[0].Width = Convert.ToInt32(dgvWords.Width * .12);
                dgvWords.Columns[1].Width = Convert.ToInt32(dgvWords.Width * .35);
                dgvWords.Columns[1].Width = Convert.ToInt32(dgvWords.Width * .35);

                connection.Open();
                table = lang.DbGetWords();
                connection.Close();

                for (Int32 i = 0; i < dgvWords.Rows.Count - 1; i++)
                    for (Int32 j = 0; j < table[1].Length; j++)
                    {
                        if (dgvWords.Rows[i].Cells[0].Value.ToString() == table[0][j])
                        {
                            dgvWords[2, i].Value = table[1][j];
                            break;
                        }
                    }
            }


        }

        private void btnSaveWords_Click(object sender, EventArgs e)
        {
            Maniyat.Language lang;

            if (dgvWords.Columns.Count == 2)
            {
                lang = (Maniyat.Language)cmDefaultLanguage.SelectedItem;

                connection.Open();
                for (Int32 i = 0; i < dgvWords.Rows.Count - 1; i++)
                    lang.DbAddWord(Convert.ToInt32(dgvWords.Rows[i].Cells[0].Value), dgvWords.Rows[i].Cells[1].Value.ToString());

                connection.Close();
            }
            else if (dgvWords.Columns.Count == 3)
            {
                lang = (Maniyat.Language)cmLanguage.SelectedItem;

                connection.Open();
                for (Int32 i = 0; i < dgvWords.Rows.Count - 1; i++)
                    lang.DbAddWord(Convert.ToInt32(dgvWords.Rows[i].Cells[0].Value), dgvWords.Rows[i].Cells[2].Value.ToString());

                connection.Close();
            }
        }

        private void btnTranslate_Click(object sender, EventArgs e)
        {
            if (cmLanguage.SelectedIndex >= 0)
            {
                if (cmDefaultLanguage.SelectedIndex >= 0)
                    languages.DefaultLanguage = (Maniyat.Language)cmDefaultLanguage.SelectedItem;
                else
                    languages.DefaultLanguage = languages["العربية"];

                languages.SelectedLanguage = (Maniyat.Language)cmLanguage.SelectedItem;

                if (languages.SelectedLanguage.RightToLeft)
                {
                    this.RightToLeftLayout = true;
                    this.RightToLeft = RightToLeft.Yes;
                }
                else
                {
                    this.RightToLeftLayout = false;
                    this.RightToLeft = RightToLeft.No;
                }

                connection.Open();

                foreach (Control ctrl in this.Controls)
                    ctrl.Text = languages.DbReadWord(ctrl.Text);

                connection.Close();

                applicationConsts();
            }
        }

        private void dgvWords_UserDeletingRow(object sender, DataGridViewRowCancelEventArgs e)
        {
            if (MessageBox.Show(deleteConfirm, "", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
            {
                connection.Open();

                if (cmDefaultLanguage.SelectedIndex >= 0)
                {
                    languages.DefaultLanguage = (Maniyat.Language)cmDefaultLanguage.SelectedItem;

                    languages.DefaultLanguage.DbRemoveWord(e.Row.Cells[1].Value.ToString());
                }

                if (cmLanguage.SelectedIndex >= 0)
                {
                    languages.SelectedLanguage = (Maniyat.Language)cmLanguage.SelectedItem;

                    languages.SelectedLanguage.DbRemoveWord(e.Row.Cells[2].Value.ToString());
                }

                connection.Close();
            }
            else
                e.Cancel = true;
        }

        private void cmDefaultLanguage_TextChanged(object sender, EventArgs e)
        {
            if (cmDefaultLanguage.Text != "")
            {
                if (cmLanguage.Text != "")
                    btnSaveWords.Text = saveLanguageWords;
                else
                    btnSaveWords.Text = saveDefaultLanguageWords;

                btnSaveWords.Enabled = true;
            }
            else
                btnSaveWords.Enabled = false;
        }

        private void cmLanguage_TextChanged(object sender, EventArgs e)
        {
            cmDefaultLanguage_TextChanged(cmLanguage, new EventArgs());
        }

        private void btnClearRows_Click(object sender, EventArgs e)
        {
            dgvWords.Rows.Clear();
        }

        //private : data member
        private Maniyat.Languages languages;
        private SqlConnection connection;
        private SqlCommand command;
        private SqlDataReader reader;

        //private : application consts
        private String deleteConfirm = "تأكيد الحذف";
        private String saveLanguageWords = "حفظ كلمات اللغة";
        private String saveDefaultLanguageWords = "حفظ كلمات اللغة الإفتراضية";


        
    }
}
