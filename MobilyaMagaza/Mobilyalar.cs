using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using static System.Windows.Forms.VisualStyles.VisualStyleElement;

namespace MobilyaMagaza
{
    public partial class Mobilyalar : Form
    {
        public Mobilyalar()
        {
            InitializeComponent();
        }
        Model1Container1 baglanti=new Model1Container1();
        private void Mobilyalar_Load(object sender, EventArgs e)

        {
            comboBox1.DataSource = baglanti.MusterilerBilgiSet.ToList();
            comboBox1.ValueMember = "MusteriNo";
            //comboBox1.DataSource = baglan.Egitmenlers.ToList();
            //comboBox1.ValueMember = "egitmenuzmanlastigikonu";
            //comboBox2.DataSource = baglan.Kursiyerlers.ToList();
            //comboBox2.ValueMember = "kursiyerno";
        }
        public void Listele()
        {
            dataGridView1.DataSource = baglanti.MobilyalarBilgiSet.ToList();
        }
        //sil butonu
        private void button4_Click(object sender, EventArgs e)
        {
            int MobilyaNo = Convert.ToInt32(textBox1.Tag);
            var sil = baglanti.MobilyalarBilgiSet.Where(x => x.MobilyaNo == MobilyaNo).FirstOrDefault();
            baglanti.MobilyalarBilgiSet.Remove(sil);
            baglanti.SaveChanges();
            Listele();
        }
        //listele görüntüle butonu
        private void button1_Click(object sender, EventArgs e)
        {
            Listele();
        }
        //kaydet ekle butonu
        private void button2_Click(object sender, EventArgs e)
        {
            MobilyalarBilgi save=new MobilyalarBilgi();
            save.MobilyaAdi = textBox1.Text;
            save.MobilyaHammaddesi=textBox2.Text;
            save.MusteriNo = Convert.ToInt32(comboBox1.Text);
            baglanti.MobilyalarBilgiSet.Add(save);
            baglanti.SaveChanges();
            Listele();

        }
        //bilgi güncelle butonu
        private void button3_Click(object sender, EventArgs e)
        {
            int MobilyaNo = Convert.ToInt32(textBox1.Tag);
            var yenile = baglanti.MobilyalarBilgiSet.Where(x => x.MobilyaNo == MobilyaNo).FirstOrDefault();
            yenile.MobilyaAdi = textBox1.Text;
            yenile.MusteriNo = Convert.ToInt32(comboBox1.Text);
            baglanti.SaveChanges();
            Listele();
            //int MusteriNo = Convert.ToInt32(textBox1.Tag);
            //var yenile = baglanti.MusterilerBilgiSet.Where(x => x.MusteriNo == MusteriNo).FirstOrDefault();

            //yenile.MusteriAdSoyad = textBox1.Text;
            //yenile.MusteriAdres = textBox2.Text;
            //yenile.MusteriTelefon = textBox3.Text;
            //baglanti.SaveChanges();
            //Listele();

        }
        //ara butonu
        private void button5_Click(object sender, EventArgs e)
        {
            dataGridView1.DataSource = baglanti.MobilyalarBilgiSet.Where(s => s.MobilyaAdi.Contains(textBox1.Text)).ToList();
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            DataGridViewRow satir = dataGridView1.CurrentRow;
            textBox1.Tag = satir.Cells["MobilyaNo"].Value.ToString();
            textBox1.Text = satir.Cells["MobilyaAdi"].Value.ToString();
            textBox2.Text = satir.Cells["MobilyaHammaddesi"].Value.ToString();
            comboBox1.Text = satir.Cells["MusteriNo"].Value.ToString();
        }
    }
}
