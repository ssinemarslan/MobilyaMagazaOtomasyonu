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
    public partial class Ozellikler : Form
    {
        public Ozellikler()
        {
            InitializeComponent();
        }
        Model1Container1 baglanti=new Model1Container1();
        public void Listele()
        {
            dataGridView1.DataSource = baglanti.OzelliklerBilgiSet.ToList();
        }
        //listele butonu
        private void button1_Click(object sender, EventArgs e)
        {
            Listele();
        }
        //ozellik ekle
        private void button2_Click(object sender, EventArgs e)
        {
            //MusterilerBilgi save = new MusterilerBilgi();
            //save.MusteriAdSoyad = textBox1.Text;
            //save.MusteriAdres = textBox2.Text;
            //save.MusteriTelefon = textBox3.Text;
            //baglanti.MusterilerBilgiSet.Add(save);
            //baglanti.SaveChanges();
            //Listele();
            OzelliklerBilgi save = new OzelliklerBilgi();
            save.MobilyaGrubu = comboBox1.Text;
            save.MobilyaRenk=textBox2.Text;
            save.Mensei = textBox3.Text;
            save.MobilyaNo = Convert.ToInt32(comboBox2.Text);
            baglanti.OzelliklerBilgiSet.Add(save);
            baglanti.SaveChanges();
            Listele();
        }
        //ozellik yenile
        private void button3_Click(object sender, EventArgs e)
        {
            int OzellikNo = Convert.ToInt32(textBox2.Tag);
            var yenile=baglanti.OzelliklerBilgiSet.Where(s=>s.OzellikNo==OzellikNo).FirstOrDefault();

            yenile.MobilyaGrubu=comboBox1.Text;
            yenile.MobilyaRenk = textBox2.Text;
            yenile.Mensei = textBox3.Text;
            yenile.MobilyaNo = Convert.ToInt32(comboBox2.Text);
        }
        //sil butonu
        private void button4_Click(object sender, EventArgs e)
        {
            int OzellikNo=Convert.ToInt32(textBox2.Tag);
            var sil = baglanti.OzelliklerBilgiSet.Where(x => x.OzellikNo == OzellikNo).FirstOrDefault();
            baglanti.OzelliklerBilgiSet.Remove(sil);
            baglanti.SaveChanges();
            Listele();
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            DataGridViewRow satir = dataGridView1.CurrentRow;
            textBox2.Tag = satir.Cells["OzellikNo"].Value.ToString();
            comboBox1.Text = satir.Cells["MobilyaGrubu"].Value.ToString();
            textBox2.Text = satir.Cells["MobilyaRenk"].Value.ToString();
            textBox3.Text = satir.Cells["Mensei"].Value.ToString();
            comboBox2.Text = satir.Cells["MobilyaNo"].Value.ToString();
        }

        private void Ozellikler_Load(object sender, EventArgs e)
        {
            comboBox2.DataSource = baglanti.OzelliklerBilgiSet.ToList();
            comboBox2.DisplayMember = "MobilyaGrubu";
            comboBox1.DataSource = baglanti.MobilyalarBilgiSet.ToList();
            comboBox1.ValueMember = "MobilyaNo";
        }

        //private void button5_Click(object sender, EventArgs e)
        //{
        //    dataGridView1.DataSource = baglanti.OzelliklerBilgiSet.Where(s => s.MusteriAdSoyad.Contains(textBox1.Text)).ToList();
        //}
    }
}
