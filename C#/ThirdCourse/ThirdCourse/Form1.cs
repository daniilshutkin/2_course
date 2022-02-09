using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ThirdCourse
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            string st;//Изначальный текст
            {
                textBox2.Clear();
                try
                {
                    string ST2;
                    st = textBox1.Text;
                    for (int i = 1; i<100; i++)
                    {
                        ST2 = st.Replace(comboBox1.Text, comboBox2.Text);
                        textBox2.Text = ST2;
                    }
                }
                catch
                {
                    if (textBox1.Text == "")
                    {
                        MessageBox.Show("Поле ввода не может быть пустым");
                    }
                }
            }
        }
    }
}
