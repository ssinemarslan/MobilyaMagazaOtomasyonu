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
    public partial class Raporlar : Form
    {
        public Raporlar()
        {
            InitializeComponent();
        }
        Model1Container1 baglanti=new Model1Container1();
        private void button1_Click(object sender, EventArgs e)
        {
            var query=baglanti.MusterilerBilgiSet.Where(musteri=>musteri.MusteriAdres=="Ümraniye");
            dataGridView1.DataSource = query.ToList();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            var query = baglanti.OzelliklerBilgiSet.Where(ozellik => ozellik.Mensei == "Türkiye");
            dataGridView1.DataSource=query.ToList();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            var query = baglanti.MobilyalarBilgiSet.Where(hammadde => hammadde.MobilyaHammaddesi == "Meşe");
            dataGridView1.DataSource=query.ToList();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            var query = baglanti.OzelliklerBilgiSet.Where
                (a => a.MobilyaGrubu == "Yemek Odası").GroupBy
                (a => a.Mensei);
            dataGridView1.DataSource = query.ToList();
        }

        private void button5_Click(object sender, EventArgs e)
        {
            var query = from mobilya in baglanti.MobilyalarBilgiSet
                        join ozellik in baglanti.OzelliklerBilgiSet on mobilya.MobilyaNo equals ozellik.MobilyaNo
                        select new
                        {
                            mobilya.MobilyaAdi,
                            mobilya.MobilyaHammaddesi,
                            ozellik.MobilyaGrubu,
                            ozellik.MobilyaRenk,
                            ozellik.Mensei
                        };
            dataGridView1.DataSource=query.ToList();
        }

        private void button6_Click(object sender, EventArgs e)
        {
            var query = from mobilyaadi in baglanti.MobilyalarBilgiSet
                        join mobilyarenk in baglanti.OzelliklerBilgiSet on mobilyaadi.MobilyaNo equals mobilyarenk.MobilyaNo
                        select new
                        {
                            mobilyaadi.MobilyaAdi,
                            mobilyarenk.MobilyaRenk
                        };
            dataGridView1.DataSource=query.ToList();

        }

        private void Raporlar_Load(object sender, EventArgs e)
        {

        }
    }
}
