const Explore = require('../models/Explore');
const { RESPONSE_MESSAGES } = require('../config/constants');

// Create educational content
exports.createExploreContent = async (req, res) => {
  try {
    const { title, content, type, thumbnailUrl, videoUrl, tags } = req.body;
    const newContent = await Explore.create({
      title,
      content,
      type,
      thumbnailUrl,
      videoUrl,
      tags,
      createdBy: req.user.uid
    });
    res.status(201).json({ success: true, data: newContent });
  } catch (error) {
    res.status(500).json({ success: false, error: error.message });
  }
};

// Search educational content
exports.searchExploreContent = async (req, res) => {
  const { query, type, tags } = req.query;
  
  try {
    const searchCriteria = {};
    
    if (query) {
      searchCriteria.title = new RegExp(query, 'i');
    }
    
    if (type) {
      searchCriteria.type = type;
    }
    
    if (tags) {
      searchCriteria.tags = { $in: tags.split(',') };
    }

    const content = await Explore.find(searchCriteria);
    
    return res.status(200).json({
      success: true,
      data: content
    });
  } catch (error) {
    console.error('Error searching explore content:', error);
    return res.status(500).json({
      success: false,
      message: error.message
    });
  }
};

exports.getExploreContent = async (req, res) => {
  try {
    const content = await Explore.getAll();
    res.status(200).json({ success: true, data: content });
  } catch (error) {
    res.status(500).json({ success: false, error: error.message });
  }
};

exports.getExploreContentById = async (req, res) => {
  try {
    const content = await Explore.getById(req.params.id);
    if (!content) {
      return res.status(404).json({ success: false, error: 'Content not found' });
    }
    res.status(200).json({ success: true, data: content });
  } catch (error) {
    res.status(500).json({ success: false, error: error.message });
  }
};

exports.updateExploreContent = async (req, res) => {
  try {
    const updated = await Explore.update(req.params.id, req.body);
    if (!updated) {
      return res.status(404).json({ success: false, error: 'Content not found' });
    }
    res.status(200).json({ success: true, data: updated });
  } catch (error) {
    res.status(500).json({ success: false, error: error.message });
  }
};

exports.deleteExploreContent = async (req, res) => {
  try {
    const deleted = await Explore.delete(req.params.id);
    if (!deleted) {
      return res.status(404).json({ success: false, error: 'Content not found' });
    }
    res.status(200).json({ success: true, data: {} });
  } catch (error) {
    res.status(500).json({ success: false, error: error.message });
  }
};
