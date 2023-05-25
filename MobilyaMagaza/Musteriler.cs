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
    public partial class Musteriler : Form
    {
        public Musteriler()
        {
            InitializeComponent();
        }
        Model1Container1 baglanti=new Model1Container1();
        //MagazicilikContainer baglanti=new MagazicilikContainer();
        private void Musteriler_Load(object sender, EventArgs e)
        {
            
            
        }
        public void Listele()
        {
            dataGridView1.DataSource = baglanti.MusterilerBilgiSet.ToList();
            //dataGridView1.DataSource = baglanti.MusterilerBilgiSet.ToList();
        }
        //listele butonu
        private void button1_Click(object sender, EventArgs e)
        {
            Listele();
        }
        //ekle butonu
        private void button2_Click(object sender, EventArgs e)
        {
            MusterilerBilgi save = new MusterilerBilgi();
            save.MusteriAdSoyad = textBox1.Text;
            save.MusteriAdres=textBox2.Text;
            save.MusteriTelefon=textBox3.Text;
            baglanti.MusterilerBilgiSet.Add(save);
            baglanti.SaveChanges();
            Listele();
        }
        //yenile butonu
        private void button3_Click(object sender, EventArgs e)
        {
            int MusteriNo = Convert.ToInt32(textBox1.Tag);
            var yenile = baglanti.MusterilerBilgiSet.Where(x => x.MusteriNo == MusteriNo).FirstOrDefault();
           
            yenile.MusteriAdSoyad= textBox1.Text;
            yenile.MusteriAdres = textBox2.Text;
            yenile.MusteriTelefon= textBox3.Text;
            baglanti.SaveChanges();
            Listele();
        }
        //sil butonu
        private void button4_Click(object sender, EventArgs e)
        {
            int MusteriNo = Convert.ToInt32(textBox1.Tag);
            var sil=baglanti.MusterilerBilgiSet.Where(x=>x.MusteriNo==MusteriNo).FirstOrDefault();
            baglanti.MusterilerBilgiSet.Remove(sil);
            baglanti.SaveChanges();
            Listele();
        }
        //ara butonu
        private void button5_Click(object sender, EventArgs e)
        {
            dataGridView1.DataSource=baglanti.MusterilerBilgiSet.Where(s=>s.MusteriAdSoyad.Contains(textBox1.Text)).ToList();
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            DataGridViewRow satir = dataGridView1.CurrentRow;
            textBox1.Tag = satir.Cells["MusteriNo"].Value.ToString();
            textBox1.Text = satir.Cells["Musteriadsoyad"].Value.ToString();
            textBox2.Text = satir.Cells["MusteriAdres"].Value.ToString();
            textBox3.Text = satir.Cells["MusteriTelefon"].Value.ToString();
            
        }
    }
}
