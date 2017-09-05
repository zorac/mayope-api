package org.mayope.api.types;

import java.util;

/**
 * A node in a Myaope schema.
 */
public abstract class Node {
    /**
     * A universally unique identifier for the node.
     */
    private UUID uuid;

    /**
     * An ID which must be unique amongst sibling nodes.
     */
    private String id;

    /**
     * A plain-text name for the node.
     */
    private String name;

    /**
     * A free-text description of the node.
     */
    private String description;

    /**
     * Get a universally unique identifier for the node.
     *
     * @return The value
     */
    public UUID getUuid() {
        return uuid;
    }

    /**
     * Set a universally unique identifier for the node.
     *
     * @param uuid The new value
     */
    public void setUuid(UUID uuid) {
        this.uuid = uuid;
    }

    /**
     * Get an ID which must be unique amongst sibling nodes.
     *
     * @return The value
     */
    public String getId() {
        return id;
    }

    /**
     * Set an ID which must be unique amongst sibling nodes.
     *
     * @param id The new value
     */
    public void setId(String id) {
        this.id = id;
    }

    /**
     * Get a plain-text name for the node.
     *
     * @return The value
     */
    public String getName() {
        return name;
    }

    /**
     * Set a plain-text name for the node.
     *
     * @param name The new value
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * Get a free-text description of the node.
     *
     * @return The value
     */
    public String getDescription() {
        return description;
    }

    /**
     * Set a free-text description of the node.
     *
     * @param description The new value
     */
    public void setDescription(String description) {
        this.description = description;
    }
}