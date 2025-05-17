const Explore = require('../models/Explore');  // Model untuk konten edukasi

// Menambah konten edukasi baru (artikel/video)
exports.createExploreContent = async (req, res) => {
  const { title, content, type, url, tags } = req.body;

  try {
    // Validasi input konten edukasi
    if (!title || !content || !type || !url) {
      return res.status(400).json({ success: false, message: 'Semua field wajib diisi' });
    }

    const exploreContent = new Explore({
      title,
      content,
      type,
      url,
      tags
    });

    await exploreContent.save();
    return res.status(201).json({
      success: true,
      message: 'Konten edukasi berhasil ditambahkan',
      exploreId: exploreContent.id
    });
  } catch (error) {
    console.error('Error creating explore content:', error);
    return res.status(500).json({ success: false, message: error.message });
  }
};

// Mengambil seluruh konten edukasi
exports.getExploreContent = async (req, res) => {
  try {
    const exploreContents = await Explore.findAll();
    return res.status(200).json({
      success: true,
      data: exploreContents
    });
  } catch (error) {
    console.error('Error fetching explore content:', error);
    return res.status(500).json({ success: false, message: error.message });
  }
};

// Mengambil konten edukasi berdasarkan ID
exports.getExploreContentById = async (req, res) => {
  const { id } = req.params;
  try {
    const exploreContent = await Explore.findById(id);
    if (!exploreContent) {
      return res.status(404).json({ success: false, message: 'Konten edukasi tidak ditemukan' });
    }

    return res.status(200).json({
      success: true,
      data: exploreContent
    });
  } catch (error) {
    console.error('Error fetching explore content by ID:', error);
    return res.status(500).json({ success: false, message: error.message });
  }
};

// Memperbarui konten edukasi berdasarkan ID
exports.updateExploreContent = async (req, res) => {
  const { id } = req.params;
  const { title, content, type, url, tags } = req.body;

  try {
    const exploreContent = await Explore.findById(id);
    if (!exploreContent) {
      return res.status(404).json({ success: false, message: 'Konten edukasi tidak ditemukan' });
    }

    await Explore.updateExploreContent(id, { title, content, type, url, tags });
    return res.status(200).json({
      success: true,
      message: 'Konten edukasi berhasil diperbarui'
    });
  } catch (error) {
    console.error('Error updating explore content:', error);
    return res.status(500).json({ success: false, message: error.message });
  }
};

// Menghapus konten edukasi berdasarkan ID
exports.deleteExploreContent = async (req, res) => {
  const { id } = req.params;
  try {
    const exploreContent = await Explore.findById(id);
    if (!exploreContent) {
      return res.status(404).json({ success: false, message: 'Konten edukasi tidak ditemukan' });
    }

    await Explore.deleteExploreContent(id);
    return res.status(200).json({
      success: true,
      message: 'Konten edukasi berhasil dihapus'
    });
  } catch (error) {
    console.error('Error deleting explore content:', error);
    return res.status(500).json({ success: false, message: error.message });
  }
};
