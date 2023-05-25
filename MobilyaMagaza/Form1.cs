using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace MobilyaMagaza
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }
        Model1Container1 baglanti = new Model1Container1();
        public bool GirisYap(string ad,string sifre)
        {
            var sorgu=from kullanici in baglanti.KullanicilarBilgiSet
                      where kullanici.KullaniciAdi==ad &&
                      kullanici.Sifre==sifre
                      select kullanici;
            if(sorgu.Any())
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            if(GirisYap(textBox1.Text,textBox2.Text))
            {
                MessageBox.Show("Giriş Başarılı :) ");
                Kategoriler k1 = new Kategoriler();
                k1.Show();
                this.Hide();
            }
            else
            {
                MessageBox.Show("Yeniden deneyiniz...");
                textBox1.Clear();
                textBox2.Clear();
            }
        }
    }
}
