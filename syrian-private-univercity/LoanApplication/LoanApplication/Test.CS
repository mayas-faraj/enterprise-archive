using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace LoanApplication
{
    public partial class Test : Form
    {
        private BankLoans BkLns;

        private Button btnPrint;
        private Label label1;
        private TextBox txNOL;
        private Button btnBank;
        private Label label2;
        private TextBox txMLN;
        private Label label3;
        private TextBox txLId;
        private Label label4;
        private TextBox txLAmount;
        private Label label6;
        private TextBox txPName;
        private Label label7;
        private Label label8;
        private TextBox txNBM;
        private Label label9;
        private RadioButton rbHome;
        private RadioButton rbCar;
        private Label label10;
        private TextBox txType;
        private Button btnAddLoan;
        private Label label11;
        private TextBox txMinimumPrice;
        private Button btnReadHomes;
        private Label label12;
        private TextBox txHomes;
        private Label label13;
        private TextBox txAllLoans;
        private Button btnPrintAll;
        private Label label14;
        private TextBox txPMSalary;
    
        public Test()
        {
            InitializeComponent();
        }

        private void btnBank_Click(object sender, EventArgs e)
        {
            BkLns = new BankLoans(Int32.Parse(txMLN.Text));

            btnAddLoan.Enabled = true;
        }

        private void btnPrint_Click(object sender, EventArgs e)
        {
            txNOL.Text = BkLns.GetLength().ToString();
        }

        private void btnAddLoan_Click(object sender, EventArgs e)
        {
            Loan tmp;

            if (rbCar.Checked)
                tmp = new CarLoan(Int32.Parse(txLId.Text), Single.Parse(txLAmount.Text), Byte.Parse(txNBM.Text), new Person(txPName.Text, Int32.Parse(txPMSalary.Text)), txType.Text);
            else
                tmp = new HomeLoan(Int32.Parse(txLId.Text), Single.Parse(txLAmount.Text), Byte.Parse(txNBM.Text), new Person(txPName.Text, Int32.Parse(txPMSalary.Text)), txType.Text);

            if (BkLns.AddLoan(tmp))
            {
                txLId.Clear();
                txLAmount.Clear();
                txNBM.Clear();
                txPName.Clear();
                txPMSalary.Clear();
                txType.Clear();
            } 
        }

        private void btnReadHomes_Click(object sender, EventArgs e)
        {
            txHomes.Text = BkLns.PrintHomeLoadGrt(Single.Parse(txMinimumPrice.Text));
        }

        private void btnPrintAll_Click(object sender, EventArgs e)
        {
            txAllLoans.Text = BkLns.PrintAllLoans();
        }

                    /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.btnPrint = new System.Windows.Forms.Button();
            this.label1 = new System.Windows.Forms.Label();
            this.txNOL = new System.Windows.Forms.TextBox();
            this.btnBank = new System.Windows.Forms.Button();
            this.label2 = new System.Windows.Forms.Label();
            this.txMLN = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.txLId = new System.Windows.Forms.TextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.txLAmount = new System.Windows.Forms.TextBox();
            this.label6 = new System.Windows.Forms.Label();
            this.txPName = new System.Windows.Forms.TextBox();
            this.label7 = new System.Windows.Forms.Label();
            this.txPMSalary = new System.Windows.Forms.TextBox();
            this.label8 = new System.Windows.Forms.Label();
            this.txNBM = new System.Windows.Forms.TextBox();
            this.label9 = new System.Windows.Forms.Label();
            this.rbHome = new System.Windows.Forms.RadioButton();
            this.rbCar = new System.Windows.Forms.RadioButton();
            this.label10 = new System.Windows.Forms.Label();
            this.txType = new System.Windows.Forms.TextBox();
            this.btnAddLoan = new System.Windows.Forms.Button();
            this.label11 = new System.Windows.Forms.Label();
            this.txMinimumPrice = new System.Windows.Forms.TextBox();
            this.btnReadHomes = new System.Windows.Forms.Button();
            this.label12 = new System.Windows.Forms.Label();
            this.txHomes = new System.Windows.Forms.TextBox();
            this.label13 = new System.Windows.Forms.Label();
            this.txAllLoans = new System.Windows.Forms.TextBox();
            this.btnPrintAll = new System.Windows.Forms.Button();
            this.label14 = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // btnPrint
            // 
            this.btnPrint.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(192)))), ((int)(((byte)(255)))));
            this.btnPrint.Location = new System.Drawing.Point(301, 82);
            this.btnPrint.Name = "btnPrint";
            this.btnPrint.Size = new System.Drawing.Size(75, 23);
            this.btnPrint.TabIndex = 14;
            this.btnPrint.Text = "Print";
            this.btnPrint.UseVisualStyleBackColor = false;
            this.btnPrint.Click += new System.EventHandler(this.btnPrint_Click);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(12, 58);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(93, 13);
            this.label1.TabIndex = 1;
            this.label1.Text = "Max Loan Number";
            // 
            // txNOL
            // 
            this.txNOL.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(255)))), ((int)(((byte)(192)))));
            this.txNOL.ForeColor = System.Drawing.Color.Black;
            this.txNOL.Location = new System.Drawing.Point(154, 84);
            this.txNOL.Name = "txNOL";
            this.txNOL.Size = new System.Drawing.Size(136, 20);
            this.txNOL.TabIndex = 1;
            this.txNOL.Text = "0";
            // 
            // btnBank
            // 
            this.btnBank.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(192)))), ((int)(((byte)(255)))));
            this.btnBank.Location = new System.Drawing.Point(301, 53);
            this.btnBank.Name = "btnBank";
            this.btnBank.Size = new System.Drawing.Size(75, 23);
            this.btnBank.TabIndex = 13;
            this.btnBank.Text = "Create Bank";
            this.btnBank.UseVisualStyleBackColor = false;
            this.btnBank.Click += new System.EventHandler(this.btnBank_Click);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(12, 87);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(90, 13);
            this.label2.TabIndex = 4;
            this.label2.Text = "Number Of Loans";
            // 
            // txMLN
            // 
            this.txMLN.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(255)))), ((int)(((byte)(192)))));
            this.txMLN.ForeColor = System.Drawing.Color.Black;
            this.txMLN.Location = new System.Drawing.Point(154, 53);
            this.txMLN.Name = "txMLN";
            this.txMLN.Size = new System.Drawing.Size(136, 20);
            this.txMLN.TabIndex = 0;
            this.txMLN.Text = "0";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(12, 180);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(43, 13);
            this.label3.TabIndex = 7;
            this.label3.Text = "Loan Id";
            // 
            // txLId
            // 
            this.txLId.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(255)))), ((int)(((byte)(192)))));
            this.txLId.ForeColor = System.Drawing.Color.Black;
            this.txLId.Location = new System.Drawing.Point(154, 177);
            this.txLId.Name = "txLId";
            this.txLId.Size = new System.Drawing.Size(136, 20);
            this.txLId.TabIndex = 2;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(12, 208);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(70, 13);
            this.label4.TabIndex = 9;
            this.label4.Text = "Loan Amount";
            // 
            // txLAmount
            // 
            this.txLAmount.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(255)))), ((int)(((byte)(192)))));
            this.txLAmount.ForeColor = System.Drawing.Color.Black;
            this.txLAmount.Location = new System.Drawing.Point(154, 205);
            this.txLAmount.Name = "txLAmount";
            this.txLAmount.Size = new System.Drawing.Size(136, 20);
            this.txLAmount.TabIndex = 3;
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(12, 265);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(70, 13);
            this.label6.TabIndex = 13;
            this.label6.Text = "Person Name";
            // 
            // txPName
            // 
            this.txPName.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(255)))), ((int)(((byte)(192)))));
            this.txPName.ForeColor = System.Drawing.Color.Black;
            this.txPName.Location = new System.Drawing.Point(154, 262);
            this.txPName.Name = "txPName";
            this.txPName.Size = new System.Drawing.Size(136, 20);
            this.txPName.TabIndex = 5;
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Location = new System.Drawing.Point(15, 294);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(106, 13);
            this.label7.TabIndex = 15;
            this.label7.Text = "Person Month Salary";
            // 
            // txPMSalary
            // 
            this.txPMSalary.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(255)))), ((int)(((byte)(192)))));
            this.txPMSalary.ForeColor = System.Drawing.Color.Black;
            this.txPMSalary.Location = new System.Drawing.Point(154, 291);
            this.txPMSalary.Name = "txPMSalary";
            this.txPMSalary.Size = new System.Drawing.Size(136, 20);
            this.txPMSalary.TabIndex = 6;
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Location = new System.Drawing.Point(12, 234);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(114, 13);
            this.label8.TabIndex = 17;
            this.label8.Text = "Loan Number Monthes";
            // 
            // txNBM
            // 
            this.txNBM.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(255)))), ((int)(((byte)(192)))));
            this.txNBM.ForeColor = System.Drawing.Color.Black;
            this.txNBM.Location = new System.Drawing.Point(154, 231);
            this.txNBM.Name = "txNBM";
            this.txNBM.Size = new System.Drawing.Size(136, 20);
            this.txNBM.TabIndex = 4;
            // 
            // label9
            // 
            this.label9.AutoSize = true;
            this.label9.Location = new System.Drawing.Point(15, 327);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(57, 13);
            this.label9.TabIndex = 18;
            this.label9.Text = "Loan Type";
            // 
            // rbHome
            // 
            this.rbHome.AutoSize = true;
            this.rbHome.Location = new System.Drawing.Point(251, 323);
            this.rbHome.Name = "rbHome";
            this.rbHome.Size = new System.Drawing.Size(52, 17);
            this.rbHome.TabIndex = 8;
            this.rbHome.Text = "Home";
            this.rbHome.UseVisualStyleBackColor = true;
            // 
            // rbCar
            // 
            this.rbCar.AutoSize = true;
            this.rbCar.Checked = true;
            this.rbCar.Location = new System.Drawing.Point(154, 323);
            this.rbCar.Name = "rbCar";
            this.rbCar.Size = new System.Drawing.Size(42, 17);
            this.rbCar.TabIndex = 7;
            this.rbCar.TabStop = true;
            this.rbCar.Text = "Car";
            this.rbCar.UseVisualStyleBackColor = true;
            // 
            // label10
            // 
            this.label10.AutoSize = true;
            this.label10.Location = new System.Drawing.Point(15, 357);
            this.label10.Name = "label10";
            this.label10.Size = new System.Drawing.Size(124, 13);
            this.label10.TabIndex = 22;
            this.label10.Text = "Car Type\\Home Address";
            // 
            // txType
            // 
            this.txType.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(255)))), ((int)(((byte)(192)))));
            this.txType.ForeColor = System.Drawing.Color.Black;
            this.txType.Location = new System.Drawing.Point(154, 354);
            this.txType.Name = "txType";
            this.txType.Size = new System.Drawing.Size(136, 20);
            this.txType.TabIndex = 9;
            // 
            // btnAddLoan
            // 
            this.btnAddLoan.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(192)))), ((int)(((byte)(255)))));
            this.btnAddLoan.Enabled = false;
            this.btnAddLoan.Location = new System.Drawing.Point(301, 175);
            this.btnAddLoan.Name = "btnAddLoan";
            this.btnAddLoan.Size = new System.Drawing.Size(75, 199);
            this.btnAddLoan.TabIndex = 15;
            this.btnAddLoan.Text = "Add Loan";
            this.btnAddLoan.UseVisualStyleBackColor = false;
            this.btnAddLoan.Click += new System.EventHandler(this.btnAddLoan_Click);
            // 
            // label11
            // 
            this.label11.AutoSize = true;
            this.label11.Location = new System.Drawing.Point(15, 440);
            this.label11.Name = "label11";
            this.label11.Size = new System.Drawing.Size(73, 13);
            this.label11.TabIndex = 26;
            this.label11.Text = "Minimum Price";
            // 
            // txMinimumPrice
            // 
            this.txMinimumPrice.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(255)))), ((int)(((byte)(192)))));
            this.txMinimumPrice.ForeColor = System.Drawing.Color.Black;
            this.txMinimumPrice.Location = new System.Drawing.Point(157, 437);
            this.txMinimumPrice.Name = "txMinimumPrice";
            this.txMinimumPrice.Size = new System.Drawing.Size(136, 20);
            this.txMinimumPrice.TabIndex = 10;
            this.txMinimumPrice.Text = "0";
            // 
            // btnReadHomes
            // 
            this.btnReadHomes.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(192)))), ((int)(((byte)(255)))));
            this.btnReadHomes.Location = new System.Drawing.Point(304, 435);
            this.btnReadHomes.Name = "btnReadHomes";
            this.btnReadHomes.Size = new System.Drawing.Size(75, 23);
            this.btnReadHomes.TabIndex = 16;
            this.btnReadHomes.Text = "Read Homes";
            this.btnReadHomes.UseVisualStyleBackColor = false;
            this.btnReadHomes.Click += new System.EventHandler(this.btnReadHomes_Click);
            // 
            // label12
            // 
            this.label12.AutoSize = true;
            this.label12.Location = new System.Drawing.Point(15, 466);
            this.label12.Name = "label12";
            this.label12.Size = new System.Drawing.Size(39, 13);
            this.label12.TabIndex = 28;
            this.label12.Text = "Homes";
            // 
            // txHomes
            // 
            this.txHomes.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(192)))), ((int)(((byte)(192)))));
            this.txHomes.Location = new System.Drawing.Point(157, 463);
            this.txHomes.Multiline = true;
            this.txHomes.Name = "txHomes";
            this.txHomes.ScrollBars = System.Windows.Forms.ScrollBars.Vertical;
            this.txHomes.Size = new System.Drawing.Size(222, 60);
            this.txHomes.TabIndex = 11;
            // 
            // label13
            // 
            this.label13.AutoSize = true;
            this.label13.Location = new System.Drawing.Point(15, 532);
            this.label13.Name = "label13";
            this.label13.Size = new System.Drawing.Size(49, 13);
            this.label13.TabIndex = 30;
            this.label13.Text = "All Loans";
            // 
            // txAllLoans
            // 
            this.txAllLoans.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(192)))), ((int)(((byte)(192)))));
            this.txAllLoans.Location = new System.Drawing.Point(157, 529);
            this.txAllLoans.Multiline = true;
            this.txAllLoans.Name = "txAllLoans";
            this.txAllLoans.ScrollBars = System.Windows.Forms.ScrollBars.Vertical;
            this.txAllLoans.Size = new System.Drawing.Size(175, 60);
            this.txAllLoans.TabIndex = 12;
            // 
            // btnPrintAll
            // 
            this.btnPrintAll.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(192)))), ((int)(((byte)(255)))));
            this.btnPrintAll.Location = new System.Drawing.Point(338, 529);
            this.btnPrintAll.Name = "btnPrintAll";
            this.btnPrintAll.Size = new System.Drawing.Size(41, 60);
            this.btnPrintAll.TabIndex = 17;
            this.btnPrintAll.Text = "Print";
            this.btnPrintAll.UseVisualStyleBackColor = false;
            this.btnPrintAll.Click += new System.EventHandler(this.btnPrintAll_Click);
            // 
            // label14
            // 
            this.label14.AutoSize = true;
            this.label14.Font = new System.Drawing.Font("Times New Roman", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label14.Location = new System.Drawing.Point(113, 9);
            this.label14.Name = "label14";
            this.label14.Size = new System.Drawing.Size(190, 24);
            this.label14.TabIndex = 32;
            this.label14.Text = "SUV HOMEWORK";
            // 
            // Test
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(192)))), ((int)(((byte)(192)))), ((int)(((byte)(255)))));
            this.ClientSize = new System.Drawing.Size(416, 610);
            this.Controls.Add(this.label14);
            this.Controls.Add(this.btnPrintAll);
            this.Controls.Add(this.label13);
            this.Controls.Add(this.txAllLoans);
            this.Controls.Add(this.label12);
            this.Controls.Add(this.txHomes);
            this.Controls.Add(this.label11);
            this.Controls.Add(this.txMinimumPrice);
            this.Controls.Add(this.btnReadHomes);
            this.Controls.Add(this.btnAddLoan);
            this.Controls.Add(this.label10);
            this.Controls.Add(this.txType);
            this.Controls.Add(this.rbCar);
            this.Controls.Add(this.rbHome);
            this.Controls.Add(this.label9);
            this.Controls.Add(this.label8);
            this.Controls.Add(this.txNBM);
            this.Controls.Add(this.label7);
            this.Controls.Add(this.txPMSalary);
            this.Controls.Add(this.label6);
            this.Controls.Add(this.txPName);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.txLAmount);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.txLId);
            this.Controls.Add(this.txMLN);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.btnBank);
            this.Controls.Add(this.txNOL);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.btnPrint);
            this.ForeColor = System.Drawing.Color.Black;
            this.Name = "Test";
            this.Text = "GUI Form";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        }
    }
