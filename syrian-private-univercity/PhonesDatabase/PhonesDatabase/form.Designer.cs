namespace PhonesDatabase
{
    partial class form
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.createCompany = new System.Windows.Forms.Button();
            this.maxCust = new System.Windows.Forms.TextBox();
            this.balance = new System.Windows.Forms.TextBox();
            this.label12 = new System.Windows.Forms.Label();
            this.name = new System.Windows.Forms.TextBox();
            this.enter = new System.Windows.Forms.Button();
            this.sub = new System.Windows.Forms.RadioButton();
            this.normal = new System.Windows.Forms.RadioButton();
            this.label1 = new System.Windows.Forms.Label();
            this.id = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.result = new System.Windows.Forms.TextBox();
            this.find = new System.Windows.Forms.Button();
            this.findId = new System.Windows.Forms.TextBox();
            this.label8 = new System.Windows.Forms.Label();
            this.output = new System.Windows.Forms.TextBox();
            this.subscriberCust = new System.Windows.Forms.TextBox();
            this.normalCust = new System.Windows.Forms.TextBox();
            this.label6 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.sortByType = new System.Windows.Forms.Button();
            this.sortByBalance = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // createCompany
            // 
            this.createCompany.Location = new System.Drawing.Point(516, 12);
            this.createCompany.Name = "createCompany";
            this.createCompany.Size = new System.Drawing.Size(259, 23);
            this.createCompany.TabIndex = 0;
            this.createCompany.Text = "إنشاء شركة حسب العدد الأعظمي للمشتركين";
            this.createCompany.UseVisualStyleBackColor = true;
            this.createCompany.Click += new System.EventHandler(this.createCompany_Click);
            // 
            // maxCust
            // 
            this.maxCust.Location = new System.Drawing.Point(394, 14);
            this.maxCust.Name = "maxCust";
            this.maxCust.Size = new System.Drawing.Size(106, 20);
            this.maxCust.TabIndex = 1;
            // 
            // balance
            // 
            this.balance.Location = new System.Drawing.Point(505, 122);
            this.balance.Name = "balance";
            this.balance.Size = new System.Drawing.Size(193, 20);
            this.balance.TabIndex = 12;
            // 
            // label12
            // 
            this.label12.AutoSize = true;
            this.label12.Location = new System.Drawing.Point(716, 125);
            this.label12.Name = "label12";
            this.label12.Size = new System.Drawing.Size(59, 13);
            this.label12.TabIndex = 18;
            this.label12.Text = "رصيد الزبون";
            // 
            // name
            // 
            this.name.Location = new System.Drawing.Point(504, 96);
            this.name.Name = "name";
            this.name.Size = new System.Drawing.Size(193, 20);
            this.name.TabIndex = 11;
            // 
            // enter
            // 
            this.enter.Enabled = false;
            this.enter.Location = new System.Drawing.Point(394, 67);
            this.enter.Name = "enter";
            this.enter.Size = new System.Drawing.Size(104, 101);
            this.enter.TabIndex = 17;
            this.enter.Text = "إدخال";
            this.enter.UseVisualStyleBackColor = true;
            this.enter.Click += new System.EventHandler(this.enter_Click);
            // 
            // sub
            // 
            this.sub.AutoSize = true;
            this.sub.Location = new System.Drawing.Point(505, 151);
            this.sub.Name = "sub";
            this.sub.Size = new System.Drawing.Size(60, 17);
            this.sub.TabIndex = 16;
            this.sub.Text = "مشترك";
            this.sub.UseVisualStyleBackColor = true;
            // 
            // normal
            // 
            this.normal.AutoSize = true;
            this.normal.Checked = true;
            this.normal.Location = new System.Drawing.Point(625, 151);
            this.normal.Name = "normal";
            this.normal.Size = new System.Drawing.Size(50, 17);
            this.normal.TabIndex = 14;
            this.normal.TabStop = true;
            this.normal.Text = "عادي";
            this.normal.UseVisualStyleBackColor = true;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(724, 151);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(51, 13);
            this.label1.TabIndex = 10;
            this.label1.Text = "نوع الزبون";
            // 
            // id
            // 
            this.id.Location = new System.Drawing.Point(504, 67);
            this.id.Name = "id";
            this.id.Size = new System.Drawing.Size(193, 20);
            this.id.TabIndex = 9;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(722, 70);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(53, 13);
            this.label2.TabIndex = 13;
            this.label2.Text = "رقم الزبون";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(717, 99);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(58, 13);
            this.label3.TabIndex = 15;
            this.label3.Text = "اسم الزبون";
            // 
            // result
            // 
            this.result.Location = new System.Drawing.Point(394, 257);
            this.result.Name = "result";
            this.result.Size = new System.Drawing.Size(381, 20);
            this.result.TabIndex = 21;
            // 
            // find
            // 
            this.find.Location = new System.Drawing.Point(394, 228);
            this.find.Name = "find";
            this.find.Size = new System.Drawing.Size(381, 23);
            this.find.TabIndex = 20;
            this.find.Text = "عرض معلومات الزبون حسب الرقم";
            this.find.UseVisualStyleBackColor = true;
            this.find.Click += new System.EventHandler(this.find_Click);
            // 
            // findId
            // 
            this.findId.Location = new System.Drawing.Point(394, 198);
            this.findId.Name = "findId";
            this.findId.Size = new System.Drawing.Size(304, 20);
            this.findId.TabIndex = 19;
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Location = new System.Drawing.Point(722, 201);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(53, 13);
            this.label8.TabIndex = 22;
            this.label8.Text = "رقم الزبون";
            // 
            // output
            // 
            this.output.Location = new System.Drawing.Point(12, 14);
            this.output.Multiline = true;
            this.output.Name = "output";
            this.output.ScrollBars = System.Windows.Forms.ScrollBars.Vertical;
            this.output.Size = new System.Drawing.Size(320, 154);
            this.output.TabIndex = 23;
            // 
            // subscriberCust
            // 
            this.subscriberCust.Location = new System.Drawing.Point(14, 186);
            this.subscriberCust.Name = "subscriberCust";
            this.subscriberCust.ReadOnly = true;
            this.subscriberCust.Size = new System.Drawing.Size(51, 20);
            this.subscriberCust.TabIndex = 25;
            // 
            // normalCust
            // 
            this.normalCust.Location = new System.Drawing.Point(182, 186);
            this.normalCust.Name = "normalCust";
            this.normalCust.ReadOnly = true;
            this.normalCust.Size = new System.Drawing.Size(50, 20);
            this.normalCust.TabIndex = 24;
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(238, 186);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(73, 13);
            this.label6.TabIndex = 28;
            this.label6.Text = "الزبائن العاديين";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(71, 189);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(89, 13);
            this.label5.TabIndex = 26;
            this.label5.Text = "الزبائن المشتركين";
            // 
            // sortByType
            // 
            this.sortByType.Location = new System.Drawing.Point(12, 254);
            this.sortByType.Name = "sortByType";
            this.sortByType.Size = new System.Drawing.Size(320, 23);
            this.sortByType.TabIndex = 29;
            this.sortByType.Text = "ترتيب القائمة حسب النوع";
            this.sortByType.UseVisualStyleBackColor = true;
            this.sortByType.Click += new System.EventHandler(this.sortByType_Click);
            // 
            // sortByBalance
            // 
            this.sortByBalance.Location = new System.Drawing.Point(12, 225);
            this.sortByBalance.Name = "sortByBalance";
            this.sortByBalance.Size = new System.Drawing.Size(320, 23);
            this.sortByBalance.TabIndex = 27;
            this.sortByBalance.Text = "ترتيب القائمة حسب الرصيد";
            this.sortByBalance.UseVisualStyleBackColor = true;
            this.sortByBalance.Click += new System.EventHandler(this.sortByBalance_Click);
            // 
            // form
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(787, 299);
            this.Controls.Add(this.output);
            this.Controls.Add(this.subscriberCust);
            this.Controls.Add(this.normalCust);
            this.Controls.Add(this.label6);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.sortByType);
            this.Controls.Add(this.sortByBalance);
            this.Controls.Add(this.result);
            this.Controls.Add(this.find);
            this.Controls.Add(this.findId);
            this.Controls.Add(this.label8);
            this.Controls.Add(this.balance);
            this.Controls.Add(this.label12);
            this.Controls.Add(this.name);
            this.Controls.Add(this.enter);
            this.Controls.Add(this.sub);
            this.Controls.Add(this.normal);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.id);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.maxCust);
            this.Controls.Add(this.createCompany);
            this.Name = "form";
            this.Text = "from";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button createCompany;
        private System.Windows.Forms.TextBox maxCust;
        private System.Windows.Forms.TextBox balance;
        private System.Windows.Forms.Label label12;
        private System.Windows.Forms.TextBox name;
        private System.Windows.Forms.Button enter;
        private System.Windows.Forms.RadioButton sub;
        private System.Windows.Forms.RadioButton normal;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox id;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TextBox result;
        private System.Windows.Forms.Button find;
        private System.Windows.Forms.TextBox findId;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.TextBox output;
        private System.Windows.Forms.TextBox subscriberCust;
        private System.Windows.Forms.TextBox normalCust;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Button sortByType;
        private System.Windows.Forms.Button sortByBalance;
    }
}

